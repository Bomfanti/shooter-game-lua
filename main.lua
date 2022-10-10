local love = require "love"
state = require 'libs.state'
require ("states/game")
require("objects/player")
require("objects/enemy")
require("objects/bullets")
require("components/Button")
require('libs/show')
require("objects.rand")
local enemies = {}
local game = {
    difficulty = 1,
    state = {
        menu = true,
        paused = false,
        running = false,
        ended = false
    },
    points = 0,
    levels = {15, 30, 60, 120}
}


function love.load()
    sprites = {}
    sprites.bullet = love.graphics.newImage('img/bullet.png')

    gameState = 1
    Player:load()
    Player2:load()
end

function love.update(dt)
    Player: update(dt)
    Player2: update(dt)
    updateBullet(dt)
    for i = 1, #enemies do
        if not enemies[i]:checkTouched(Player.x, Player.y, Player.radius) then
            enemies[i]:move(Player.x, Player.y)

            for i = 1, #game.levels do
                if math.floor(game.points) == game.levels[i] then
                    table.insert(enemies, 1, enemy(game.difficulty * (i + 1)))
                    game.points = game.points + 1
                end
            end
        else
            changeGameState("ended") -- changed to ended (game over)
        end
    end

end

function love.draw()
   Player:draw()
   Player2:draw()

end

