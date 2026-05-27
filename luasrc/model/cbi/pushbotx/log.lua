f = SimpleForm("pushbotx")
f.reset = false
f.submit = false
f:append(Template("pushbotx/pushbotx_log"))
return f
