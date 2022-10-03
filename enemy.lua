Enemy = {}
require("player")

function Enemy:load()
    self.x = 50
    self.y = love.graphics.getHeight()/2
    self.width = 25
    self.height = 25
    self.speed = 500
end

function Enemy: update(dt)
    self:move(dt)
    self:checkBoundaris()
end

function Enemy:move(dt)

    if Enemy.x < Player.x then 					
        Enemy.x = Enemy.x + (Enemy.speed * 2.5 * dt)		
    end
     
    if Enemy.x > Player.x then 					
        Enemy.x = Enemy.x - (Enemy.speed * 2.5 * dt) 		
    end
     
    if Enemy.y < Player.y then 					
        Enemy.y = Enemy.y + (Enemy.speed * 2.5 * dt)		
    end
     
    if Enemy.y > Player.y then 					
        Enemy.y = Enemy.y - (Enemy.speed * 2.5 * dt)		
    end

end

function Enemy:checkBoundaris()
    if self.y < 0 then
        self.y=0
    elseif self.y + self.height > love.graphics.getHeight() then 
        self.y = love.graphics.getHeight() - self.height
    end

    if self.x < 0 then
        self.x=0
    elseif self.x + self.width > love.graphics.getWidth() then 
        self.x = love.graphics.getWidth() - self.width
    end
end

function Enemy: draw()
    love.graphics.circle("fill", self.x, self.y, 30)
end