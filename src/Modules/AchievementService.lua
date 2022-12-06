--@class AchievementService
--@author Midnightific

--// Initialization

local Module = {}

Module._Achievements = { -- Up to your use, this is a barebones module designed for forking
    Id = 1,
    Name = "Test",
    Description = "Test",
    Rewards = {

    }
}

--// Functions

function Module:GetAchievementById(Id)
    return self._Achievements[Id]
end

function Module:GetAchievementByName(Name)
    for _, Achievement in pairs(self._Achievements) do
        if Achievement.Name == Name then
            return Achievement
        end
    end
end

function Module:GetAchievements()
    return self._Achievements
end

function Module:UpdateAchievement(Achievement, ...)
    local Args = {...}
    for _, Arg in pairs(Args) do
        if type(Arg) == "table" then
            for Key, Value in pairs(Arg) do
                Achievement[Key] = Value
            end
        end
    end
end

function Module:CreateAchievement(Name, ...)
    local Args = {...}
    local Achievement = {
        Id = #self._Achievements + 1,
        Name = Name,
        Description = "No description",
        Rewards = {

        }
    }
    for _, Arg in pairs(Args) do
        if type(Arg) == "table" then
            for Key, Value in pairs(Arg) do
                Achievement[Key] = Value
            end
        end
    end
    table.insert(self._Achievements, Achievement)
    return Achievement
end

return Module
