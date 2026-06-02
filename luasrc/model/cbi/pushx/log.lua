f = SimpleForm("pushx")
f.reset = false
f.submit = false
f:append(Template("pushx/pushx_log"))
return f
