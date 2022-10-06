--@class CashManager
--@author Midnightific

local DataStoreService = game:GetService("DataStoreService")

local CashCache = DataStoreService:GetDataStore("CashCache")

local Module = {}

function Module.GetCash(Player)
	local success, PlayerCash = pcall(function()
		return CashCache:GetAsync(Player.UserId)
	end)

	if success then
		if PlayerCash == nil then
			CashCache:SetAsync(Player.UserId, 0)
			return PlayerCash
		end

		return PlayerCash
	end
end

function Module.AddCash(Player, AmountToAdd)
	local success, PlayerCash = pcall(function()
		return CashCache:IncrementAsync(Player.UserId, AmountToAdd)
	end)

	if success then
		print(Player.Name.." has been given ".. AmountToAdd .." cash.")
	end
end

function Module.RemoveCash(Player)
	local success, PlayerCash = pcall(function()
		return CashCache:RemoveAsync(Player.UserId)
	end)

	if success then
		print("Subtracted cash from: " .. Player.Name.. ".") 
	end
end

return Module
