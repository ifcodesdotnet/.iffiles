-- Disable the default Command + Q behavior and close the current window instead
hs.hotkey.bind({"cmd"}, "Q", function()
    local win = hs.window.frontmostWindow()
    if win then
        win:close()  -- Close the current window
    else
        hs.alert.show("No window to close!")
    end
end)
