local love = require("love")
--pico8 pallette! in love2d
local colorValues = {
    dark_blue     = {0.114, 0.169, 0.325},
    dark_purple   = {0.494, 0.145, 0.325},
    dark_green    = {0.000, 0.529, 0.318},
    brown         = {0.671, 0.322, 0.212},
    dark_grey     = {0.373, 0.341, 0.310},
    light_grey    = {0.761, 0.765, 0.780},
    white         = {1.000, 0.945, 0.910},
    red           = {1.000, 0.000, 0.302},
    orange        = {1.000, 0.639, 0.000},
    yellow        = {1.000, 0.925, 0.153},
    green         = {0.000, 0.894, 0.212},
    blue          = {0.161, 0.678, 1.000},
    lavender      = {0.514, 0.463, 0.612},
    pink          = {1.000, 0.467, 0.659},
    light_peach   = {1.000, 0.800, 0.667},
}
PicoCols = setmetatable({}, { --creates function like PicoCols.dark_blue() which then call setColor with the appropriate value
    __index = function(_, key)
        local color = colorValues[key]
        if color then
            return function() love.graphics.setColor(color[1], color[2], color[3]) end
        else
            return nil -- In case of an invalid color
        end
    end
})
return PicoCols
