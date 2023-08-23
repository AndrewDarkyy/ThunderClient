-- thunder client
repeat task.wait()until game:IsLoaded()


-- optmizations bc luraph lags a lot, these can be patched / fucked at any moment so yea
for _,v in getconnections(workspace.ChildAdded)do
    v:Disable()
end
for _,v in getconnections(game.Players.PlayerRemoving)do
    v:Disable()
end
for _,v in getconnections(game.Players.PlayerAdded)do
    v:Disable()
end
for _,v in game.Players:GetChildren()do
    for _,v2 in getconnections(v.CharacterAdded)do
        v2:Disable()
    end
end
for _,v in getgc(true)do
    if type(v)=="table"and rawget(v,"parts")and type(v.parts)=="table"then
        table.clear(v.parts)
        -- multiple tables so dont need to break
    end
end

loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/dca3e69649ed196af0ac6577f743a0ae.lua"))()
