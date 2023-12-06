for i = 1, 10 do
    print(i)
end

local hp = 33
for i = 1, 10 do
    hp = hp - i
    print(hp)
    if hp > i then
        print("You are still alive")
    else
        print("You are dead")
        break
    end
end
-- every 10  seconds do something
local start = tick()
local interval = 10
local duration = 60 -- 1 minute
local lastTime = 0

while tick() - start < duration do
    if tick() - lastTime >= interval then
        --  your action
        print("10 seconds passed")
        lastTime = tick()
    end
    wait(1) -- yield
end

