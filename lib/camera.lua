-- trevor roddy
-- communication by any means
-- jump to bottom to see list of callable functions!

-- lerp
-- love.graphics

local love = require("love")
local utils=require("000utils.utils")

local function cam_attach(_c)
    love.graphics.push()
    love.graphics.scale(0.5,0.5)
    local transx=love.graphics.getWidth()/2
    local transy=love.graphics.getHeight()/2
    love.graphics.translate(transx,transy)
    love.graphics.translate(love.graphics.getWidth() / 2, love.graphics.getHeight() / 2)
    love.graphics.rotate(_c.rotation)
    love.graphics.translate(-love.graphics.getWidth() / 2, -love.graphics.getHeight() / 2)
    love.graphics.translate(-_c.pos.x, -_c.pos.y)
end
local function cam_detach()
    love.graphics.pop()
end
local function cam_update(_c, player, config)
    local target = {
        x = player.x - (config.screen_width / 2),
        y = player.y - (config.screen_height / 2)
    }
    local lead = {
        x=player.xvel*10,
        y=-player.yvel*10,
    }
    _c.pos.x = utils.Lerp(_c.pos.x, target.x+lead.x, 0.01)
    _c.pos.y = utils.Lerp(_c.pos.y, target.y+lead.y, 0.03)
end

local camera = {
    pos = {x = 0, y = 0},
    rotation=0,
    attach=cam_attach,
    detach=cam_detach,
    update=cam_update
}

return camera