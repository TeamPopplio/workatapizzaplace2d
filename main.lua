function love.load()
    Enums = require("enums")
    Graphics = require("gfx")
    Game = {
        Job = Enums.Unassigned,
        TimeOfDay = Enums.Morning,
        Season = Enums.Spring
    }
    Debug = true
    DebugOptions = {
        Job = Enums.Cashier,
        TimeOfDay = Enums.Midday,
        Season = Enums.Summer
    }
    JobVars = {
        Cashier = {
            CurrentButton = Enums.NoButton
        }
    }
    Timers = {
        CashierButtonTimer = Enums.BaseTimer
    }
    if Debug == true then
        Game = DebugOptions
    end
end

function love.draw()
    --main bottom screen routine
    --job routines
    --cashier
    if Game.Job == Enums.Cashier then
        love.graphics.draw(Graphics.CashierClicker,95,62)
        if JobVars.Cashier.CurrentButton ~= Enums.NoButton then
            love.graphics.draw(Graphics.CashierOverlays[JobVars.Cashier.CurrentButton],95,62)
        end
    end
end
function love.mousepressed( x, y, button, istouch, presses )
    --job routines
    --cashier
    if Game.Job == Enums.Cashier then
        function callback()
            JobVars.Cashier.CurrentButton = Enums.NoButton
        end
        if x >= 100 and y >= 66 and x < 158 and y < 123 then --top left pizza button
            JobVars.Cashier.CurrentButton = Enums.TopLeftButton
        elseif x >= 163 and y >= 66 and x < 222 and y < 123 then --top right pizza button
            JobVars.Cashier.CurrentButton = Enums.TopRightButton
        elseif x >= 100 and y >= 128 and x < 158 and y < 186 then --bottom left pizza button
            JobVars.Cashier.CurrentButton = Enums.BottomLeftButton
        elseif x >= 164 and y >= 128 and x < 222 and y < 186 then --bottom right pizza button
            JobVars.Cashier.CurrentButton = Enums.BottomRightButton
        else
            callback()
        end
        StartTimer(Timers.CashierButtonTimer,10,callback)
    end
end
function love.update(dt)
    for key,value in pairs(Timers) do
        if value.Active == true then
            value.CurWait = value.CurWait + 1
            if value.CurWait >= value.End then
                value.Active = false
                value.Callback()
            end
        end
    end
end
function StartTimer(timer,endtime, callback)
    timer.End = endtime
    timer.CurWait = 0
    timer.Active = true
    timer.Callback = callback
end
