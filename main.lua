local love = require "love"

require ("game")
require("player")

function love.load()
    Player:load()
end

function love.update(dt)
    Player: update(dt)
end

function love.draw()
   Player:draw(s)
end

