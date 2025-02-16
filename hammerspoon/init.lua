local mash3 = {"ctrl", "alt", "cmd"}
local frameCache = {}

-------------------------------------------------------------------------------
-- Window Management
--
-- Hold ctrl-alt-cmd and press one of the following to move the current window
--
--      U      |      I      |     O
--   top-left  | full screen | top-right
--   quadrant  |             | quadrant
--   ----------+-------------+----------
--      J      |      K      |     L
--   left half | half width  | right half
--             | full height |
--   ----------+-------------+----------
--      M      |      ,      |     .
--   bot-left  |   center    | bot-right
--   quadrant  |             | quadrant
--
-------------------------------------------------------------------------------

hs.hotkey.bind(mash3, "u", function()
    local win = hs.window.focusedWindow()
    win:moveToUnit({x=0, y=0, w=0.5, h=0.5}, 0)
end)

hs.hotkey.bind(mash3, "i", function()
    local win = hs.window.focusedWindow()
    win:moveToUnit({x=0, y=0, w=1, h=1}, 0)
end)

hs.hotkey.bind(mash3, "o", function()
    local win = hs.window.focusedWindow()
    win:moveToUnit({x=0.5, y=0, w=0.5, h=0.5}, 0)
end)

hs.hotkey.bind(mash3, "j", function()
    local win = hs.window.focusedWindow()
    win:moveToUnit({x=0, y=0, w=0.5, h=1}, 0)
end)

hs.hotkey.bind(mash3, "k", function()
    local win = hs.window.focusedWindow()
    win:moveToUnit({x=0.25, y=0, w=0.5, h=1}, 0)
end)

hs.hotkey.bind(mash3, "l", function()
    local win = hs.window.focusedWindow()
    win:moveToUnit({x=0.5, y=0, w=0.5, h=1}, 0)
end)

hs.hotkey.bind(mash3, "m", function()
    local win = hs.window.focusedWindow()
    win:moveToUnit({x=0, y=0.5, w=0.5, h=0.5}, 0)
end)

hs.hotkey.bind(mash3, ",", function()
    local win = hs.window.focusedWindow()
    win:moveToUnit({x=0.25, y=0.2, w=0.5, h=0.6}, 0)
end)

hs.hotkey.bind(mash3, ".", function()
    local win = hs.window.focusedWindow()
    win:moveToUnit({x=0.5, y=0.5, w=0.5, h=0.5}, 0)
end)


-------------------------------------------------------------------------------
-- App Shortcuts
-------------------------------------------------------------------------------

appShortcuts = {
    {"C", "Chrome"},
    {"F", "Firefox"},
    {"M", "Mail"},
    {"P", "KeePassXC"},
    {"S", "Slack"},
    {"T", "iTerm"},
}


for _,shortcut in ipairs(appShortcuts) do
    hs.hotkey.bind(mash3, shortcut[1], function()
        hs.application.launchOrFocus(shortcut[2])
    end)
end


-------------------------------------------------------------------------------
-- Tool Menu
-------------------------------------------------------------------------------

function resetUsb()
    hs.notify.new({
        title = 'Hammerspoon',
        informativeText = 'Please run `reset-usb` from a terminal 🙂'
    }):send()
end

local toolsMenu = hs.menubar.new()
toolsMenu:setTitle("Tools")
toolsMenu:setMenu({
        { title="Reset USB", fn = resetUsb}})


-------------------------------------------------------------------------------
-- OBS
-------------------------------------------------------------------------------

-- hs.hotkey.bind(mash3, "i", function()
--     for k,v in pairs(hs.screen.mainScreen():availableModes()) do
--         print(k,v)
--     end
--     print(hs.screen.mainScreen():frame())
-- end)

-- Positions the current window appropriately for display
-- in OBS
--
hs.hotkey.bind(mash3, "w", function()

    -- Canvas size required by OBS
    local w,h = 1920, 1080

    local mode = hs.screen.mainScreen():currentMode()
    local win = hs.window.focusedWindow()
    win:setFrame({
            x = (mode.w - w / mode.scale) / 2,
            y = (mode.h - h / mode.scale) / 2,
            w = w / mode.scale,
            h = h / mode.scale})
end)

hs.hotkey.bind(mash3, "0", function()
    local win = hs.window.focusedWindow()
    if frameCache[win:id()] then
        win:setFrame(frameCache[win:id()], 0)
        frameCache[win:id()] = nil
    else
        frameCache[win:id()] = win:frame()
        win:moveToUnit({x=0, y=0, w=1, h=1}, 0)
    end
end)

hs.hotkey.bind({"shift", "ctrl"}, "left", function()
    local win = hs.window.focusedWindow()
    -- Below moves it to a different monitor, not sure how to move it to a different desktop
    --win:moveOneScreenWest()
end)

hs.hotkey.bind({"shift", "ctrl"}, "right", function()
    local win = hs.window.focusedWindow()
    -- Below moves it to a different monitor, not sure how to move it to a different desktop
    --win:moveOneScreenEast()
end)


--hs.hotkey.bind(mash, "T", function() os.execute("/Applications/iTerm.app/Contents/MacOS/iTerm2 --new-window &") end)


-------------------------------------------------------------------------------
-- Auto-reloading
-------------------------------------------------------------------------------

function reloadConfig(paths)
    hs.reload()
end

hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()

hs.notify.new({
    title='Hammerspoon',
    informativeText='Config loaded!'
}):send()
