local PlayerData = {}

local DEFAULT_PLAYER_DATA = {
    ["Coins"] = 0,
    ["Jump"] = 0
}

function PlayerData.getData(player)
    local userId = player.UserId
    local data = PlayerData[userId] or DEFAULT_PLAYER_DATA
    print(PlayerData)
    PlayerData[userId] = data
    return data
end

function PlayerData.updateData(player, key, value)
    local userId = player.UserId
    PlayerData[userId][key] = value
end

return PlayerData