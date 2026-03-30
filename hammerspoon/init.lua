-- Disable the default Command + Q behavior and close the current window instead
hs.hotkey.bind({"cmd"}, "Q", function()
    local win = hs.window.frontmostWindow()
    if win then
        win:close()  -- Close the current window
    else
        hs.alert.show("No window to close!")
    end
end)

-- Move focused window to the leftmost monitor (Cmd+Shift+Left)
hs.hotkey.bind({"cmd", "shift"}, "left", function()
  local win = hs.window.focusedWindow()
  local screens = hs.screen.allScreens()

  table.sort(screens, function(a, b)
    return a:frame().x < b:frame().x
  end)

  win:moveToScreen(screens[1])
end)

-- Move focused window to the rightmost monitor (Cmd+Shift+Right)
hs.hotkey.bind({"cmd", "shift"}, "right", function()
  local win = hs.window.focusedWindow()
  local screens = hs.screen.allScreens()

  table.sort(screens, function(a, b)
    return a:frame().x < b:frame().x
  end)

  win:moveToScreen(screens[#screens])
end)

-- Move focused window to the top half of the screen (Cmd+Shift+Up)
hs.hotkey.bind({"cmd", "shift"}, "up", function()
  local win = hs.window.focusedWindow()
  local screen = win:screen():frame()

  win:setFrame({
    x = screen.x,
    y = screen.y,
    w = screen.w,
    h = screen.h / 2
  })
end)

-- Move focused window to the bottom half of the screen (Cmd+Shift+Down)
hs.hotkey.bind({"cmd", "shift"}, "down", function()
  local win = hs.window.focusedWindow()
  local screen = win:screen():frame()

  win:setFrame({
    x = screen.x,
    y = screen.y + (screen.h / 2),
    w = screen.w,
    h = screen.h / 2
  })
end)