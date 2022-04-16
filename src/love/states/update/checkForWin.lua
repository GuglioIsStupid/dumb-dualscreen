return {
    update = function()
        if (box1X >= 580 and box1X <= 640) and (box1Y >= 0 and box1Y <= 60) then
            box1Winning = true
        else
            box1Winning = false
        end
        if (box2X >= 460 and box2X <= 520) and (box2Y >= bottomHeight and box2Y and box2Y <= bottomHeight + 60) then
            box2Winning = true
        else
            box2Winning = false
        end
        if box1Winning and box2Winning then
        else
            doingCountdown = false
        end
    end
}