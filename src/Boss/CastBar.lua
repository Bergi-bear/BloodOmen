do --Инициализация
    TimerStart(CreateTimer(), 0.1, false, function()
        if BlzLoadTOCFile("Main.toc") then
            --print("успех")
        else
            print("провал загрузки ток кастом бара")
        end
    end)
end


function HealthBarAdd(u)
    local bar = BlzCreateSimpleFrame("MyFakeBar", BlzGetOriginFrame(ORIGIN_FRAME_GAME_UI, 0), 0)
    BlzFrameSetVisible(bar,true)
    BlzFrameSetTexture(bar, "Replaceabletextures\\Teamcolor\\Teamcolor00.blp", 0, true)
    BlzFrameSetTexture(BlzGetFrameByName("MyFakeBarBorder",0),"MyBarBorder.blp", 0, true)
    BlzFrameSetText(BlzGetFrameByName("MyFakeBarTitle",0), "Boss")
    BlzFrameSetAbsPoint(bar,FRAMEPOINT_CENTER,0.4,0.55)
    BlzFrameSetSize(bar,0.4,.04)
    local lefttext = BlzGetFrameByName("MyFakeBarLeftText",0)
    local righttext = BlzGetFrameByName("MyFakeBarRightText",0)
    local function on_timer()
        BlzFrameSetValue(bar, GetUnitLifePercent(u))
        BlzFrameSetText(lefttext, R2I(GetWidgetLife(u)))
        BlzFrameSetText(righttext, R2I(BlzGetUnitMaxHP(u)))
    end
    TimerStart(CreateTimer(),0.5,true, on_timer)
    return bar
end