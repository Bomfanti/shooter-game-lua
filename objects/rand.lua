Player2 = {}


function Player2:load()
    self.x = 500
    self.y = love.graphics.getHeight()/2
    self.width = 25
    self.height = 25
    self.speed = 500

end

function Player2: update(dt)
    self:move(dt)
    self:checkBoundaris()
end


function Player2:move(dt)
    if love.keyboard.isDown("w") then
        self.y = self.y -self.speed * dt
    elseif love.keyboard.isDown("s") then
        self.y= self.y + self.speed * dt
    end

    if love.keyboard.isDown("a") then
        self.x = self.x -self.speed * dt
    elseif love.keyboard.isDown("d") then
        self.x= self.x + self.speed * dt
    end
end

function Player2:checkBoundaris()
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

function Player2:draw()
    love.graphics.rectangle("line", self.x, self.y, self.width, self.height)

end

function Player2:faceMouse()
    return math.atan2(Player2.y - love.mouse.getY(), Player2.x - love.mouse.getX()) + math.pi
end