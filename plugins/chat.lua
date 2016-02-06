local function run(msg)
if msg.text == "سلام" then
	return "سلام علیکم"
end
if msg.text == "کیر" then
	return "تو کسس ننت"
end
if msg.text == "Hello" then
	return "farsi beharf goshad"
end
if msg.text == "hello" then
	return "Hi honey"
end
if msg.text == "کسس ننت" then
	return "کیر آقام دست ننت"
end
if msg.text == "Salam" then
	return "Salam aleykom"
end
if msg.text == "salam" then
	return "va aleykol asalam"
end
if msg.text == "ali" then
	return "ali bia in pashmak karet dare"
end
if msg.text == "ناموسا" then
	return "ننت و آقام چالوسن"
end
if msg.text == "علی" then
	return "علی بیا این پشمک کارت داره"
end
if msg.text == "ZAC" then
	return "Barash bezan sak"
end
if msg.text == "sultan" then
	return "jan?"
end
if msg.text == "خوبی" then
	return "فدات تو خوبی"
end	
if msg.text == "Sultan" then
	return "jan?"
end
if msg.text == "bot" then
	return "hum?"
end
if msg.text == "Bot" then
	return "Huuuum?"
end
if msg.text == "?" then
	return "Hum??"
end
if msg.text == "Bye" then
	return "Babay"
end
if msg.text == "bye" then
	return "Bye Bye"
end
end
return {
	description = "Chat With Robot Server", 
	usage = "chat with robot",
	patterns = {
		"^[Hh]i$",
		"^[Hh]ello$",
		"^[Bb]ot$",
		"^[Bb]ye$",
		"^?$",
		"^سلام$",
		"^خوبی$",
		"^علی$",
		"^کس ننت$",
		"^ناموسا$",
		"^ali$",
		"^Ali$",
		"^Sultan$",
		"^sultan$",
		"^کیر$",
		"^[Ss]alam$",
		}, 
	run = run,
    --privileged = true,
	pre_process = pre_process
}
