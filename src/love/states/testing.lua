return {
    enter = function()
        box1Y, box1X, box2Y, box2X = 0, 0, 324, 124
    end,

    load = function()

    end,

    update = function()
        boxMoving:update()
        checkForWin:update()
    end,

    draw = function()
        love.graphics.setColor(0,1,0,0.3)
        love.graphics.rectangle("fill",580,0,60,60)
        graphics.rectangleBottom("fill",580,0,60,60)
        love.graphics.setColor(1,1,1)
        boxMoving:drawBoxes()
    end
}
