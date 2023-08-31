-- thunder client
repeat wait() until game:IsLoaded()

if game.PlaceId == 286090429 or game.PlaceId == 11924224825 then
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/dca3e69649ed196af0ac6577f743a0ae.lua"))() -- thunder client
elseif game.PlaceId == 621129760 or game.PlaceId == 4249058633 or game.PlaceId == 3527629287 or game.PlaceId == 4505939773 then
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/53db65a6472cddecdbdc4f5445993466.lua"))() -- darkyyware
else
    game.Players.LocalPlayer.kick(game.Players.LocalPlayer, "This game is NOT supported")
end
