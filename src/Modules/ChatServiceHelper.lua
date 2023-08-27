--// Initialization

local ServerScriptService = game:GetService("ServerScriptService")

local Module = {}

--// Functions

function Module:RetrieveChatService()
    local ChatService = nil

    if ServerScriptService:FindFirstChild("ChatServiceRunner") then
        ChatService = require(ServerScriptService.ChatServiceRunner:WaitForChild("ChatService"))
    end

    return ChatService
end

function Module:MutePlayer(Player: Player, Channel)
    local ChatService = self:RetrieveChatService()
    local Channel = ChatService:GetChannel(Channel)

    if ChatService and Channel then
        Channel:MuteSpeaker(Player)
    end
end

function Module:UnmutePlayer(Player: Player, Channel)
    local ChatService = self:RetrieveChatService()
    local Channel = ChatService:GetChannel(Channel)

    if ChatService and Channel then
        Channel:UnmuteSpeaker(Player)
    end
end

return Module
