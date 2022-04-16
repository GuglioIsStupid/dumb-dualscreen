local _DEBUG = true

function love.load()    
    -- load libriries 
    baton = require "lib.baton"
	Gamestate = require "lib.gamestate"
    lume = require "lib.lume"
    Timer = require "lib.timer"
    lovesize = require "lib.lovesize"

    mouseX = 0
    mouseY = 0
    box1Winning = false
    box2Winning = false
    countdownPrint = ""

    -- load modules
    graphics = require "modules.graphics"
    input = require "modules.input"
    
    -- load states
    testing = require "states.testing"

    -- Update states
    boxMoving = require "states.update.moving"
    checkForWin = require "states.update.checkForWin"

    _DSBACKGROUND = graphics.newImage(love.graphics.newImage(graphics.imagePath("dual-screen/background")))
    _DSBACKGROUND.sizeX, _DSBACKGROUND.sizeY = 6, 6

    love.window.setMode(640, 644, {resizable=true, vsync=true})
    lovesize.set(640, 644)
    bottomHeight = lovesize.getHeight() / 2 + 1 -- + 1 to make it line with border
    bottomWidth = lovesize.getWidth() - 120
    topHeight = lovesize.getHeight() / 2 - 1 -- - 1 to make it line up with border
    topWidth = lovesize.getWidth()

    Gamestate.switch(testing)
    
end

function love.update(dt)
    input:update()
    graphics.screenBase(lovesize.getWidth(), lovesize.getHeight())
    Gamestate.update(dt)
    
    if mouseY >= bottomHeight then
        if love.mouse.getX() >= 520 then 
            mouseX = 0
        elseif love.mouse.getX() <= 120 then
            mouseX = 0
        else
            mouseX = love.mouse.getX() - 120
        end
    else
        mouseX = love.mouse.getX()
    end
    mouseY = love.mouse.getY()
end

function love.keypressed(key)
	if key == "6" then
		love.filesystem.createDirectory("screenshots")

		love.graphics.captureScreenshot("screenshots/" .. os.time() .. ".png")
    elseif key == "escape" then
        love.event.quit()
    else
        Gamestate.keypressed(key)
    end
end

function love.resize(width, height)
	lovesize.resize(width, height)
    bottomHeight = lovesize.getHeight() / 2 + 1 -- + 1 to make it line with border
    bottomWidth = lovesize.getWidth() - 240
    topHeight = lovesize.getHeight() / 2 - 1 -- - 1 to make it line up with border
    topWidth = lovesize.getWidth()
end

function love.mousepressed(x, y, button, istouch, presses)
	Gamestate.mousepressed(x, y, button, istouch, presses)
end

function love.draw()
    graphics.screenBase(lovesize.getWidth(), lovesize.getHeight())
	lovesize.begin()
        -- Background
        _DSBACKGROUND:draw()
        --
        Gamestate.draw()

        -- Borders
        love.graphics.setColor(0,0,0)
        love.graphics.rectangle("fill", 0, (lovesize.getWidth()/2)-1, lovesize.getWidth(), 4)
        love.graphics.rectangle("fill", 0, 0 + bottomHeight, 120, bottomHeight)
        love.graphics.rectangle("fill", 520, 0 + bottomHeight, 120, bottomHeight) 
        love.graphics.setColor(1,1,1)
        --

    lovesize.finish()
    graphics.screenBase(love.graphics.getWidth(), love.graphics.getHeight())
    
    if _DEBUG then
        love.graphics.setColor(0,0,0)
        love.graphics.print(
            "FPS: " .. tostring(love.timer.getFPS()) ..
			"\nLUA MEM USAGE (KB): " .. tostring(math.floor(collectgarbage("count"))) ..
			"\nGRAPHICS MEM USAGE (MB): " .. tostring(math.floor(love.graphics.getStats().texturememory / 1048576)) ..
            "\nMouse X: " .. tostring(mouseX) ..
            "\nMouse Y: " .. tostring(mouseY) ..
            "\nBox 1 Winning: " .. tostring(box1Winning) ..
            "\nBox 2 Winning: " .. tostring(box2Winning) .. 
            "\nWin Countdown: " .. countdownPrint
        )
        love.graphics.setColor(1,1,1)
    end
    
end

function love.quit()

end
