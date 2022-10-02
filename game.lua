require("player")
require ("bullet")


function love.load()
    Player:load()
end

function love.update(dt)
    Player: update(dt)
end

function love.draw()
   Player:draw(s)
end

