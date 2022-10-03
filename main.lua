local love = require "love"
require ("game")
require("player")
require("enemy")

function love.load()
    Player:load()
    Enemy:load()
end

function love.update(dt)
    Player: update(dt)
    Enemy:update(dt)
end

function love.draw()
   Player:draw()
   Enemy:draw()
end

