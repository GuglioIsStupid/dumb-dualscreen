return {
    update = function()
        if input:down("box1moveUp") then
            if box1Y >= 0 then
                box1Y = box1Y - 2
            end
        end
        if input:down("box1moveDown") then
            if box1Y <= topHeight - 20 then
                box1Y = box1Y + 2
            end
        end
        if input:down("box1moveLeft") then
            if box1X >= 0 then
                box1X = box1X - 2
            end
        end
        if input:down("box1moveRight") then 
            if box1X <= topWidth then
                box1X = box1X + 2
            end
        end

        if input:down("box2moveUp") then
            if box2Y >= 322 then
                box2Y = box2Y - 2
            else
                box2Y = 320
            end
        end
        if input:down("box2moveDown") then
            if box2Y <= 624 then
                box2Y = box2Y + 2
            end
        end
        if input:down("box2moveLeft") then
            if box2X >= 120 then
                box2X = box2X - 2
            end
        end
        if input:down("box2moveRight") then 
            if box2X <= 500 then
                box2X = box2X + 2
            end
        end
    end,

    drawBoxes = function()
        love.graphics.setColor(1,0,0)
        love.graphics.rectangle("fill", box1X, box1Y, 20, 20)
        love.graphics.rectangle("fill", box2X, box2Y, 20, 20)
        love.graphics.setColor(1,1,1)
    end
}