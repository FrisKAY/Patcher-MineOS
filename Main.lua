local GUI = require("GUI")
local system = require("System")
local image = require("Image")
local filesystem = require("Filesystem")
local paths = require("Paths")
local internet = require("Internet")
local userSettings = system.getUserSettings()

local currentScriptDirectory = filesystem.path(system.getCurrentScript())
local localization = system.getCurrentScriptLocalization()

localization.install = localization.install or "Install"

local workspace, window = system.addWindow(GUI.filledWindow(1, 1, 50, 21, 0xF0F0F0))
local layout = window:addChild(GUI.layout(1, 1, 1, 1, 1, 1))
layout:addChild(GUI.image(1, 1, image.load(currentScriptDirectory .. "Icon.pic")))
local switch = layout:addChild(GUI.switchAndLabel(1, 1, 41, 6, 0x336DFF, 0xE1E1E1, 0xFFFFFF, 0xA5A5A5, localization.what, true)).switch
local installButton = layout:addChild(GUI.button(1, 1, 36, 3, 0xE1E1E1, 0x696969, 0xD2D2D2, 0x3C3C3C, localization.install))

	
installButton.onTouch = function()
  installButton:remove()
  internet.download("https://raw.githubusercontent.com/FrisKAY/Patcher-MineOS/master/proot/Applications/Patcher.app/Main.lua", "/Users/proot/Applications/Patcher.app/Main.lua")
  internet.download("https://raw.githubusercontent.com/FrisKAY/Patcher-MineOS/master/proot/Applications/Patcher.app/Icon.pic", "/Users/proot/Applications/Patcher.app/Icon.pic")
  internet.download("https://raw.githubusercontent.com/FrisKAY/Patcher-MineOS/master/proot/Applications/Patcher.app/Localizations/Russian.lang", "/Users/proot/Applications/Patcher.app/Localizations/Russian.lang")
  internet.download("https://raw.githubusercontent.com/FrisKAY/Patcher-MineOS/master/proot/Applications/Patcher.app/Modules/1_Disks/Icon.pic", "/Users/proot/Applications/Patcher.app/Modules/1_Disks/Icon.pic")
  internet.download("https://raw.githubusercontent.com/FrisKAY/Patcher-MineOS/master/proot/Applications/Patcher.app/Modules/1_Disks/Main.lua", "/Users/proot/Applications/Patcher.app/Modules/1_Disks/Main.lua")
  internet.download("https://raw.githubusercontent.com/FrisKAY/Patcher-MineOS/master/proot/Applications/Patcher.app/Modules/3_System/Icon.pic", "/Users/proot/Applications/Patcher.app/Modules/3_System/Icon.pic")
  internet.download("https://raw.githubusercontent.com/FrisKAY/Patcher-MineOS/master/proot/Applications/Patcher.app/Modules/3_System/Main.lua", "/Users/proot/Applications/Patcher.app/Modules/3_System/Main.lua")
  internet.download("https://raw.githubusercontent.com/FrisKAY/Patcher-MineOS/master/proot/Desktop/Patcher.ink", "/Users/proot/Desktop/Patcher.ink")
  internet.download("https://raw.githubusercontent.com/FrisKAY/Patcher-MineOS/master/proot/Desktop/.icons", "/Users/proot/Desktop/.icons")
  internet.download("https://raw.githubusercontent.com/FrisKAY/Patcher-MineOS/master/proot/Settings.cfg", "/Users/proot/Settings.cfg")
  internet.download("https://raw.githubusercontent.com/FrisKAY/Patcher-MineOS/master/proot/Versions.cfg", "/Users/proot/Versions.cfg")
  if switch.state then
    GUI.alert(localization.okok)
    computer.shutdown(true)
  else
    GUI.alert(localization.ok)
  end
end


local labelServer = layout:addChild(GUI.text(1, 1, 0xD2D2D2, localization.version))
window.onResize = function(width, height)
	window.backgroundPanel.width, window.backgroundPanel.height = width, height
	layout.width, layout.height = width, height - layout.localY + 1
end

--------------------------------------------------------------------------------

window:resize(window.width, window.height)
workspace:draw()
