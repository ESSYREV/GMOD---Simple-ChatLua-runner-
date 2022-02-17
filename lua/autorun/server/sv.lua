local allowedChatLuaPlayers = {
    ['steamid'] = true,
    ['steamid2'] = true 
}
--[[
 В эту таблицу вы записываете свой стимайди, но вместо
 true вы можете написать свой ник, или далее через комментарий
 чтобы не забыть, кто указан на какой-либо строке.

 Далее, вы можете работать с Lua через чат.
 - Как?
 - Начните сообщение с _ а далее просто пишите код
 Чтобы взаимодействовать с собой, используется me
 Например: me:Kill()
 Чтобы взаимодействовать с предметом перед собой - this
 Например: this:Remove()
--]]


hook.Add( "PlayerSay", "esrv.ChatLua", function( ply, text )
    if allowedChatLuaPlayers[ply:SteamID()] and text[1] == "_" then
        text = string.Replace(text, "[", "")
        local me = "local me = Entity("..ply:EntIndex()..");"
        local this = "local this = me:GetEyeTrace().Entity;"
        RunString(me..this..text)
        -- return false
        -- Если return false, то сообщение не будет выведено в чат.
    end
end)
