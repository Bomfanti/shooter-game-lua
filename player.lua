Player = {}

function Player:load()
    self.x = 50
    self.y = love.graphics.getHeight()/2
    self.width = 25
    self.height = 25
    self.speed = 500
end

function Player: update(dt)
    self:move(dt)
    self:checkBoundaris()
    if love.mouse.isDown(1) and self.canShoot then
		if game.time > .25 then -- prevents a bullet from being shot when the game starts
			if self.heat <= 0 then
                local target = nil
                -- trackpad shooting mode
                if game.trackpadMode and self.closestEnemy ~= player and self.closestEnemy ~= nil then
                    target = self.closestEnemy.position + vector(math.random(-35, 35), math.random(-35, 35))
                else
					local mx, my = game.camera:mousePosition() -- find where the mouse is in the game
					mx, my = mx, my
                    target = vector(mx, my)
                end
                local bullet = game:addBullet(Bullet:new(
                    self.position,
                    target,
                    self.velocity
                ))
                bullet:setSource(self)
                -- critical hits
                if math.random() <= self.criticalChance then
                    bullet:setDamage(self.bulletDamage * self.damageMultiplier * self.criticalMultiplier)
                    bullet.critical = true
                else
                    bullet:setDamage(self.bulletDamage * self.damageMultiplier)
                    bullet.critical = false
                end
                bullet:setSpeed(self.bulletVelocity)
                bullet:setRadius(self.bulletRadius)
                bullet:setLife(self.bulletLife)
                bullet.dropoffDistance = self.bulletDropoffDistance
                bullet.dropoffAmount = self.bulletDropoffAmount

				self.heat = self.rateOfFire

                signal.emit('playerShot', self, bullet)
			end
		end
	end
end

function Player:move(dt)
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

function Player:checkBoundaris()
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

function Player: draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end