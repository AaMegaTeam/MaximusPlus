--[[

     **************************
     *  BlackPlus Plugins...  *
     *                        *
     *     By @MehdiHS        *
     *                        *
     *  Channel > @Black_Ch   *
     **************************
	 
]]
do

local function run(msg, matches)
  if matches[1] == 'plist' or 'planlist' then
    send_document(get_receiver(msg), "/root/blackplus/data/me/payment.webp", ok_cb, false)
      return reply_msg(msg.id,"><b>Plans List For M A X I M U S +</b>\n\n<i>1 Month :</i><b>5000T</b>\n\n<i>2 Month:</i><b>8000T</b>\n\n<i>Unlimited:</i><b>15000T</b>\n___________________________________________________\n<b>You can ask</b>@teshne<b>To create you a group</b>", ok_cb, false)
end
end
return {
  patterns = {
    "^[#!/]([Pp]list)$",
	"^[#!/]([Pp]lanlist)$",
    "^([Pp]list)$",
	"^([Pp]lanlist)$",

    },
  run = run
}
end
--[[

     **************************
     *  BlackPlus Plugins...  *
     *                        *
     *     By @MehdiHS        *
     *                        *
     *  Channel > @Black_Ch   *
     **************************
	 
]]
