local template = assert(loadScript(radio.template))()
local margin = template.margin
local indent = template.indent
local lineSpacing = template.lineSpacing
local tableSpacing = template.tableSpacing
local sp = template.listSpacing.field
local yMinLim = radio.yMinLimit
local x = margin
local y = yMinLim - lineSpacing
local inc = { x = function(val) x = x + val return x end, y = function(val) y = y + val return y end }
local labels = {}
local fields = {}

if apiVersion >= 1.41 then
    fields[#fields + 1] = { t = "Altitude",  x = x,         y = inc.y(lineSpacing), sp = x + sp, min = 0, max = 1, vals = { 1 }, table = { [0]="OFF","ON"} }
    fields[#fields + 1] = { t = "Limite",             x = x,          y = inc.y(lineSpacing), sp = x + sp, min = 5, max = 500, vals = { 1, 2 } }
    fields[#fields + 1] = { t = "Lim bef max",        x = x,          y = inc.y(lineSpacing), sp = x + sp, min = 0, max = 50, vals = { 3, 4 } }
end

return {
   read        = 42, -- MSP_MIXER_CONFIG
   write       = 43, -- MSP_SET_MIXERCONFIG
   title       = "Altitude",
   reboot      = false,
   eepromWrite = true,
   minBytes    = 16,
   labels      = labels,
   fields      = fields,
}

