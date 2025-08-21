local requests = require('requests')
local json = require('json')

function main()
    repeat wait(0) until isSampAvailable()

    local request = requests.get('https://raw.githubusercontent.com/legacy-Chay/legacy/main/NickName.json')
    local data = json.decode(request.text)
    local nick = sampGetPlayerNickname(select(2, sampGetPlayerIdByCharHandle(PLAYER_PED)))

    sampAddChatMessage("Ваш ник: " .. nick, -1)

    local function res()
        for _, n in ipairs(data.nicknames) do
            if nick == n then
                return true
            end
        end
        return false
    end

    if not res() then
        sampAddChatMessage('Ошибка: ник не привязан. Иди покупай.', -1)
        return
    end

    sampAddChatMessage('Доступ разрешен, ник привязан.', -1)
end
