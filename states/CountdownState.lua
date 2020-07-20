CountdownState = Class{__includes = BaseState}

COUNTDOWN_TIME = 0.75

function CountdownState:init()
    -- body
    self.count = 3
    self.timer = 0
    sounds['hurt']:play()
end

function CountdownState:update(dt)
    -- body
    if pause == false then
        self.timer = self.timer + dt

        if self.timer > COUNTDOWN_TIME then
            self.timer = self.timer % COUNTDOWN_TIME
            self.count = self.count - 1
            if self.count == 1 or self.count == 2 then
                sounds['hurt']:play()
            end

            if self.count == 0 then
                gStateMachine:change('play')
            end
        end
    end
end

function CountdownState:render()
    -- body
    love.graphics.setFont(hugeFont)
    love.graphics.printf(tostring(self.count), 0, 120, VIRTUAL_WIDTH, 'center')
end