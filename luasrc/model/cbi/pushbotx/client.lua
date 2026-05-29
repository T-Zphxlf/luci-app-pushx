f = SimpleForm("pushbotx")
luci.sys.call("sh /usr/bin/pushbotx/pushbotx client")
f.reset = false
f.submit = false
f:append(Template("pushbotx/pushbotx_client"))
return f
