M={}
-- -- imports
require("lib/pico_pal")
require("love")
math.randomseed(love.timer.getTime())
local tree_positions={
  math.random(love.graphics.getWidth()),
  math.random(love.graphics.getHeight()),
  math.random(love.graphics.getWidth()),
  math.random(love.graphics.getHeight()),
  math.random(love.graphics.getWidth()),
  math.random(love.graphics.getHeight()),
  math.random(love.graphics.getWidth()),
  math.random(love.graphics.getHeight()),
  math.random(love.graphics.getWidth()),
  math.random(love.graphics.getHeight()),
  math.random(love.graphics.getWidth()),
  math.random(love.graphics.getHeight()),
  math.random(love.graphics.getWidth()),
  math.random(love.graphics.getHeight()),
  math.random(love.graphics.getWidth()),
  math.random(love.graphics.getHeight()),
  math.random(love.graphics.getWidth()),
  math.random(love.graphics.getHeight()),
  math.random(love.graphics.getWidth()),
  math.random(love.graphics.getHeight()),
}

function forall_trees(dofn)
   for odd=1,#tree_positions,2 do
     dofn({tree_positions[odd], tree_positions[odd+1]})
   end
end

function M.load()


  local function drawfn_from_image(img_location)
    local img = love.graphics.newImage(img_location)
    local quad = love.graphics.newQuad(0, 0, img:getWidth(), img:getHeight(), img)
    local function drawfn(pos)
      love.graphics.draw(img, quad, pos[1], pos[2])
    end
    return drawfn
  end
---@diagnostic disable-next-line: lowercase-global
  boat_pos={500,100}
  Draw_boat = drawfn_from_image("assets/full_boat-export.png")
---@diagnostic disable-next-line: lowercase-global
  tree_pos={100,100}


    
  Draw_tree = drawfn_from_image("assets/tree_3.png")
end

function M.draw()
  love.graphics.clear()
  Draw_boat(boat_pos)
  Draw_tree(tree_pos)
  forall_trees(Draw_tree)
end

function M.update(dt) end
function M.handle_keypress(key)
  -- TODO s: screenshake
  -- if key=="s"
end
return M
