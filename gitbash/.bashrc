# I got most of the code for this snippet from the following link:
#  https://docs.github.com/en/authentication/connecting-to-github-with-ssh/working-with-ssh-key-passphrases?platform=windows
env=~/.ssh/agent.env

agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }

agent_start () {
    (umask 077; ssh-agent >| "$env")
    . "$env" >| /dev/null ; }

add_keys () {
    for file in /c/Users/"$(whoami)"/keys/*; do
        # checking to see if the file in the current iteration has
        #  a file extension. If the file does not have a file extension
        #  add it to the ssh-agent.
        if [[ ! "$file" == *.* ]]; then
            #echo "$file"
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