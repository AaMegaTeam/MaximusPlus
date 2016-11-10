local function get_variables_hash(msg)
  if msg.to.type == 'chat' or msg.to.type == 'channel' then
    return 'chat:bot:variables'
  end
end 

local function get_value(msg, var_name)
  local hash = get_variables_hash(msg)
  if hash then
    local value = redis:hget(hash, var_name)
    if not value then
      return 'من اینو بلد نیستم 😋. اما اگه میخوای اینو  /teachme  کلیک کن تا بتونی یادم بدی'
    else
      return value
    end
  end
end


local function list_chats(msg)
  local hash = get_variables_hash(msg)

  if hash then
    local names = redis:hkeys(hash)
    local text = 'لیست چت ️\n\n'
    for i=1, #names do
      text = text..'⭕️ '..names[i]..'\n'
    end
    return text
  else
  return 
  end
end


local function save_value(msg, name, value)
  if (not name or not value) then
    return "Usage: !set var_name value"
  end
  local hash = nil
  if msg.to.type == 'chat' or msg.to.type == 'channel'  then
    hash = 'chat:bot:variables'
  end
  if hash then
    redis:hset(hash, name, value)
    return name..'\n ثبت شد!'
  end
end
local function del_value(msg, name)
  if not name then
    return
  end
  local hash = nil
  if msg.to.type == 'chat' or msg.to.type == 'channel'  then
    hash = 'chat:bot:variables'
  end
  if hash then
    redis:hdel(hash, name)
    return name..'\n! پاک شد'
  end
end

--[[local function delallchats(msg)
  local hash = 'chat:bot:variables'

  if hash then
    local names = redis:hkeys(hash)
    for i=1, #names do
      redis:hdel(hash,names[i])
    end
    return "ثبت شد!"
  else
  return 
  end
end]]





local function run(msg, matches)
 if is_sudo(msg) then
    local name = matches[3]
  local value = matches[4]
  if matches[2] == 'rm' then
    local output = delallchats(msg)
    return output
  end
  if matches[2] == '+' then
  local name1 = user_print_name(msg.from)
  savelog(msg.to.id, name1.." ["..msg.from.id.."] saved ["..name.."] as > "..value )
  local text = save_value(msg, name, value)
  return text
    elseif matches[2] == '-' then
    local text = del_value(msg,name)
    return text
    end
 end
  if matches[1] == 'list' then
    local output = list_chats(msg)
    return output
  else
    local name = user_print_name(msg.from)
    savelog(msg.to.id, name.." ["..msg.from.id.."] used /get ".. matches[1])-- save to logs
    return get_value(msg, matches[1])
  end
if matches[1] == "teachme" then
    if is_sudo(msg) then
      local receiver = get_receiver(msg)
      send_photo2(get_receiver(msg), "./data/photos/help.jpg", "لطفا مثل عکس بالا به من آموزش بده (:", ok_cb, false)
    end
  end
end
return {
  patterns = {
    "^[!/#](list)$",
    "^[#!/](save) (+) ([^%s]+) (.+)$",
    --"^[#!/](chat) (rm)$",
    "^[#!/](save) (-) (.*)$",
    "^[!/#](teachme)$",
  ""
  },
  run = run
}
