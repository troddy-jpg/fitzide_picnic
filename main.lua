local fitzide_picnic = require("fitzide_picnic")

function love.load()
 fitzide_picnic.load()
end

function love.draw()
  fitzide_picnic.draw()
end

function love.update(dt)
  fitzide_picnic.update(dt)
end

function love.keypressed(key)
  fitzide_picnic.handleKeypress(key)
end
