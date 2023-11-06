staparlando = false


RegisterNetEvent("SaltyChat_TalkStateChanged")
AddEventHandler("SaltyChat_TalkStateChanged", function(isTalking)   -- Change this if you don't use saltychat on your server. You need to detect when a player is talking, every voice system has the proper exports.
    staparlando = isTalking
end)

--RegisterNetEvent("rog:userTalking")
--AddEventHandler("rog:userTalking", function(lastTalkingStatus)   -- If You're using pma-voice use this instead of "SaltyChat_TalkStateChanged". You need to add TriggerEvent("rog:userTalking",lastTalkingStatus) in pma-voice/client/init/proximity.lua/129 and it should work 
    --staparlando = lastTalkingStatus
--end)


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
