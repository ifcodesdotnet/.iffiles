#  The code for this script was primarily taken from the following piece of
#    GitHub Documentation:
#    https://docs.github.com/en/authentication/connecting-to-github-with-ssh/working-with-ssh-key-passphrases#auto-launching-ssh-agent-on-git-for-windows
env=~/.ssh/agent.env

agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }

agent_start () {
    (umask 077; ssh-agent >| "$env")
    . "$env" >| /dev/null ; }

add_keys () {
    #  Loop through all of key inside the keys directory. The keys directory
    #    should be inside of the users home directory.
    for file in /c/Users/"$(whoami)"/keys/*; do
        #  While iterating through all of the keys we need to check if the key
        #    is either a private or a public key. If the key is a private key
        #    we need to update it's permissions before we add it the ssh-agent.
        if [[ ! "$file" == *.pub ]]; then
            chmod 600 "$file"
            ssh-add "$file" > /dev/null 2>&1
        fi
    done
}

agent_load_env

# agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2=agent not running
agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)

if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
    agent_start
    add_keys
elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
    add_keys
fi

unset env

alias k='ssh-add -l'
alias kd='ssh-add -D'