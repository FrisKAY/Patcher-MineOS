
local GUI = require("GUI")
local paths = require("Paths")
local system = require("System")
local fs = require("filesystem")
local component = require("component")
local image = require("Image")
local EFI = component.eeprom
local totalMemory = math.modf(computer.totalMemory() / 1024)
local freeMemory = math.modf(computer.freeMemory() / 1024)
local address = computer.address()
local cache = fs.path(system.getCurrentScript())
local lvlenergy = math.modf(computer.energy())
local maxenergy = math.modf(computer.maxEnergy())
local uptime = math.modf(computer.uptime())
local efiname = EFI.getLabel()
local boot = EFI.getData()

local module = {}

local workspace, window, localization = table.unpack({...})

--------------------------------------------------------------------------------

module.name = localization.system
module.margin = 3
module.onTouch = function()
   window.contentLayout:addChild(GUI.text(1, 1, 0x2D2D2D, freeMemory .." КБ из ".. totalMemory .."КБ свободно"))
   window.contentLayout:addChild(GUI.text(1, 1, 0x2D2D2D, lvlenergy .. " из ".. maxenergy .." энегрии"))
   window.contentLayout:addChild(GUI.text(1, 1, 0x2D2D2D, uptime .. " сек. работы компьютера"))
   window.contentLayout:addChild(GUI.text(1, 1, 0x2D2D2D, efiname .. " - Ваш EFI"))
   window.contentLayout:addChild(GUI.text(1, 1, 0x2D2D2D, boot .. " - Диск с ОС"))
   

	workspace:draw()
end

--------------------------------------------------------------------------------

return module

