menu = {}

menu.itens = {
    {
        title = "NEW GAME",
        action = function()
            switch(game)
        end,
    },
    {
        title = "QUIT",
        action = function()
            love.event.quit()
        end,
    },
}


function menu:draw()
    love.graphics.setColor(1, 1, 1)

    game.background:draw()

    for i, button in pairs(self.buttons) do
        button:draw()
    end

	local lineOffset = self.lineLengthOffset
	love.graphics.line(self.lineX, self.lineY1+lineOffset, self.lineX, self.lineY2-lineOffset)

	love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), 120+55 + math.floor(self.headerTweenAmount))

    love.graphics.setFont(self.titleFont)
    love.graphics.setColor(0, 0, 0)
	local x = self.titleX
	x = math.floor(x)
    love.graphics.print(self.title, x, 70)
end