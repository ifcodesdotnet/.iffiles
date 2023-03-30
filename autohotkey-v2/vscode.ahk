#+c::
{
    ; this will give me the path to the vscode.exe
    code := StrReplace(A_AppData, "Roaming", "Local\Programs\Microsoft VS Code\Code.exe")

    ; this will start up a new vscode window
    ^!h::Run, %code%

}