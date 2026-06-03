f = SimpleForm("pushx")
luci.sys.call("/usr/bin/pushx/pushx client")
f.reset = false
f.submit = false
f:append(Template("pushx/pushx_client"))
return f
