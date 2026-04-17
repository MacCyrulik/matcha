local autoR = false
local antiAfk = false

-- Toggle listener
task.spawn(function()
    while true do
        task.wait(0.05)

        if iskeypressed(0xDB) then -- '['
            autoR = not autoR
            print(autoR and "Auto-R: ON" or "Auto-R: OFF")
            task.wait(0.3)
        end

        if iskeypressed(0xDD) then -- ']'
            antiAfk = not antiAfk
            print(antiAfk and "Anti-AFK: ON" or "Anti-AFK: OFF")
            task.wait(0.3)
        end
    end
end)

-- Auto-R loop
task.spawn(function()
    while true do
        task.wait(0.5)
        if autoR then
            keypress(0x52)
            task.wait(0.05)
            keyrelease(0x52)
        end
    end
end)

-- Anti-AFK loop
while true do
    task.wait(60)
    if antiAfk then
        keypress(0x10)
        task.wait(0.1)
        keyrelease(0x10)
    end
end