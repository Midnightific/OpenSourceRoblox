--@class GameInit
--@author Midnightific

--[[
    Documentation:

    GameInit is a class that is used to initialize the game. It is used to load the game's assets, and to create the game's objects.

    GameInit.BindToClose(Function [])
        Binds a function to the game's close event. This function will be called when the game is closed.

    GameInit:DisconnectServer()
        Disconnects the server from the game.
    
    GameInit:PreloadObjects()
        Preloads the game's objects.
]]--

local Players = game:GetService("Players")
local CollectionService = game:GetService("CollectionService")
local ContentProvider = game:GetService("ContentProvider")

local GameInit = {}

function GameInit.BindToClose(Function)
    game:BindToClose(Function)
end

function GameInit:DisconnectServer()
    if #Players:GetPlayers() <= 1 then
        for i, Player in pairs(Players:GetPlayers) do
            Player:Kick("Server disconnected.")
        end
    end
end

function GameInit:PreloadObjects()
    for i, Object in ipairs(workspace:GetDescendants()) do
        if CollectionService:HasTag(Object, "InitLoad") then
            ContentProvider:PreloadAsync({Object})
        end
    end
end

return GameInit
