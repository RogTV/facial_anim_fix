staparlando = false


RegisterNetEvent("SaltyChat_TalkStateChanged")
AddEventHandler("SaltyChat_TalkStateChanged", function(isTalking)   -- Change this if you don't use saltychat on your server. You need to detect when a player is talking, every voice system has the proper exports.
    staparlando = isTalking
end)


Citizen.CreateThread(function()
  RequestAnimDict('facials@gen_male@variations@normal')
  RequestAnimDict('mp_facial')
 
  while true do
    Citizen.Wait(1000)
    if staparlando then
        SetFacialIdleAnimOverride(PlayerPedId(), "mood_talking_1", 0)
    elseif not staparlando then
        SetFacialIdleAnimOverride(PlayerPedId(), "mood_normal_1", 0)
    end
  end
end)
