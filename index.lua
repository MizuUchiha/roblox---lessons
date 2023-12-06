local function calaculate(a,b)
    return (((a + b) * a - b) /a)
end

local firstNumber = 254
local secondNumber = 890

print("First Number: " + firstNumber)
print("Second Number: " + secondNumber)

if firstNumber > secondNumber then
    print("First Number is greater than Second Number")
elseif firstNumber < secondNumber then
    print("First Number is less than Second Number")
else
    print("First Number is equal to Second Number")
end