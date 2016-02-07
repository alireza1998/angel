--deite by { @amody7 }
local function user_print_name(user)
   if user.print_name then
      return user.print_name
   end
   local text = ''
   if user.first_name then
      text = user.last_name..' '
   end
   if user.lastname then
      text = text..user.last_name
   end
   return text
end

local function returnids(cb_extra, success, result)
   local receiver = cb_extra.receiver
   --local chat_id = "chat#id"..result.id
   local chat_id = result.id
   local chatname = result.print_name

   local text = 'ايديات الدردشة '..chatname
      ..' {'..chat_id..'}\n'
      ..'يوجد '..result.members_num..' اعضاء في المجموعة'
      ..'\n💠───────────────💠️\n'
      i = 0
   for k,v in pairs(result.members) do
      i = i+1
      text = text .. i .. ". " .. string.gsub(v.print_name, "_", " ") .. " (" .. v.id .. ")\n"
   end
   send_large_msg(receiver, text)
end

local function username_id(cb_extra, success, result)
   local receiver = cb_extra.receiver
   local qusername = cb_extra.qusername
   local text = 'العضو '..qusername..' غير موجود في المجموعة!'
   for k,v in pairs(result.members) do
      vusername = v.username
      if vusername == qusername then
      	text = 'ایدی و اسم عضو:\n'..'@'..vusername..' : '..v.id
      end
   end
   send_large_msg(receiver, text)
end

local function run(msg, matches)
   local receiver = get_receiver(msg)
   if matches[1] == "/if"then
     local text = 'اسم : '.. string.gsub(user_print_name(msg.from),'_', ' ') .. '\nایدی : ' .. msg.from.id .. '\nنام خانوادگی : '..'@'.. msg.from.username
      if is_chat_msg(msg) then
         text = text .. "\n\nدر این گروه هست " .. string.gsub(user_print_name(msg.to), '_', ' ') .. " \n(ایدی گروه: " .. msg.to.id  .. ")"
      end
      return text
   elseif matches[1] == "chatt" then
      -- !ids? (chat) (%d+)
      if matches[2] and is_sudo(msg) then
         local chat = 'chat#id'..matches[2]
         chat_info(chat, returnids, {receiver=receiver})
      else
         if not is_chat_msg(msg) then
            return "انت ليست في المجموعة."
         end
         local chat = get_receiver(msg)
         chat_info(chat, returnids, {receiver=receiver})
      end
   else
   	if not is_chat_msg(msg) then
   		return "هذه الاوامر فقط في المجموعة تعمل"
   	end
   	local qusername = string.gsub(matches[1], "@", "")
   	local chat = get_receiver(msg)
   	chat_info(chat, username_id, {receiver=receiver, qusername=qusername})
   end
end

return {
   description = "معرفة المعلومات الخاصة بك والخاصة بأصدقائك.",
   usage = {
      "/if معرفة المعلومات الخاصة بك.",
      "/ids chat :اظهار معرفات الاعضاء في المجموعة.",
      "/ids <chat_id> : معرفة اعضاء الشات عن طريق الايدي.",
      "/info <username> : معرفة معلومات الشخص عن طريق اسم المستخدم."
   },
   patterns = {
      "^/if",
      "^/ids? (chatt) (%d+)$",
      "^/ids? (chatt)$",
      "^/info (.*)$"
   },
   run = run
}  
