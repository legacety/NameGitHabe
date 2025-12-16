require "lib.moonloader"

function main()
    repeat wait(0) until isSampAvailable()

    local ip, port = sampGetCurrentServerAddress()
    local serverName = sampGetCurrentServerName()
 sampAddChatMessage(string.format("Вы на сервере: %s (%s:%d)", serverName, ip, port),-1)
end
