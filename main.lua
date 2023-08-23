-- thunder client

coroutine.wrap(function()
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/dca3e69649ed196af0ac6577f743a0ae.lua"))()
end)()

local Converted = {
    ["ScreenGui"] = Instance.new("ScreenGui");
    ["Frame"] = Instance.new("Frame");
    ["UICorner"] = Instance.new("UICorner");
    ["TextLabel"] = Instance.new("TextLabel");
}
Converted["ScreenGui"].ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Converted["ScreenGui"].Parent = game.CoreGui
Converted["Frame"].BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Converted["Frame"].BorderSizePixel = 0
Converted["Frame"].BackgroundTransparency = 1
Converted["Frame"].Position = UDim2.new(0.367591411, 0, 0.324189514, 0)
Converted["Frame"].Size = UDim2.new(0, 420, 0, 281)
Converted["Frame"].Parent = Converted["ScreenGui"]
Converted["UICorner"].Parent = Converted["Frame"]
Converted["TextLabel"].Font = Enum.Font.FredokaOne
Converted["TextLabel"].Text = "Wait until thunder client loads"
Converted["TextLabel"].TextColor3 = Color3.fromRGB(200, 200, 200)
Converted["TextLabel"].TextSize = 50
Converted["TextLabel"].TextWrapped = true
Converted["TextLabel"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["TextLabel"].BackgroundTransparency = 1
Converted["TextLabel"].TextTransparency = 1
Converted["TextLabel"].BorderColor3 = Color3.fromRGB()
Converted["TextLabel"].BorderSizePixel = 0
Converted["TextLabel"].Size = UDim2.new(0, 420, 0, 285)
Converted["TextLabel"].Parent = Converted["Frame"]
game:GetService("TweenService"):Create(Converted["Frame"], TweenInfo.new(1), {BackgroundTransparency = 0}):Play()
game:GetService("TweenService"):Create(Converted["TextLabel"], TweenInfo.new(1), {TextTransparency = 0}):Play()
repeat wait() until getgenv().thunderclient______loaded_
game:GetService("TweenService"):Create(Converted["Frame"], TweenInfo.new(1), {BackgroundTransparency = 1}):Play()
game:GetService("TweenService"):Create(Converted["TextLabel"], TweenInfo.new(1), {TextTransparency = 1}):Play()
wait(2)
Converted["ScreenGui"]:Destroy()
