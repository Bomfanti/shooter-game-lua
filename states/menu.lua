menu = {}

menu.itens = {
    {
        title = "NEW GAME",
        action = function()
            love.event.quit()
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

end