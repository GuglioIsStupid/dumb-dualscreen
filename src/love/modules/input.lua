return baton.new {
    controls = {
        confirm = {"key:return", "button:start"},
        -- Top screen box
        box1moveUp = {"key:w"},
        box1moveDown = {"key:s"},
        box1moveLeft = {"key:a"},
        box1moveRight = {"key:d"},
        -- Bottom screen box
        box2moveUp = {"key:up"},
        box2moveDown = {"key:down"},
        box2moveLeft = {"key:left"},
        box2moveRight = {"key:right"}
    },
    joystick = love.joystick.getJoysticks()[1]
}
