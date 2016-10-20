do
local function aminpt(msg, matches)
if is_sudo(msg) then
return [[
baladi ke baba :|
]]
end
if is_momod(msg) then
return [[
!id
دریافت مشخصات گروه
!ban [username|reply]
اخراج دائمی شخص با ریپلی یا آیدی
!unban [username]
خارج کردن شخص از اخراج دائمی فقط با آیدی
!kick
اخراج شخص از سوپرگروه
!newlink
ساخت لینگ جدید برای گروه
/setlink
تنظیم لینک گروه در حالی که ربات سازنده گروه نباشه
!link
دریافت لینک گروه
!lock [links|contacts|tag|forward|media|webpage|rtl]
قفل کردن لینک و شماره و آیدی و فوروارد و پیام چند رسانه ای و لینک سایت و پیغام های طولانی
!unlock [links|contacts|tag|forward|media|webpage|rtl]
باز کردن قفل دستورات بالا
-------------------------------------------------------------------------------------------
Good Luck
]]
end
end
return{
   patterns + {
   "^[!#/](help)$",
   },
   run = aminpt,
   }
   
   end
