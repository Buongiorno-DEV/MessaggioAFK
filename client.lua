tempoPrimaDiAFK = 300 --Tempo che si deve aspettare prima che esca il messaggio 
intervalloEsecuzione = 5 --Tempo di invio del comando (in questo modo appare la scritta ogni 5 secondi)

Citizen.CreateThread(function()
    local time = tempoPrimaDiAFK

    while true do
        Wait(1000)

        local playerPed = GetPlayerPed(-1)
        if playerPed then
            local currentPos = GetEntityCoords(playerPed, true)

            if currentPos == prevPos then
                time = time - 1

                if time <= 0 then
                    ExecuteCommand("me ~r~Giocatore Assente~r~")
                    time = intervalloEsecuzione
                elseif time == math.ceil(intervalloEsecuzione / 4) then
                    ExecuteCommand("me ~r~Giocatore Assente~r~")
                end
            else
                time = tempoPrimaDiAFK
            end

            prevPos = currentPos
        end
    end
end)