module("luci.controller.pushbotx",package.seeall)

function index()
	if not nixio.fs.access("/etc/config/pushbotx") then
		return
	end

	entry({"admin", "services", "pushbotx"}, alias("admin", "services", "pushbotx", "setting"),_("全能推送"), 30).dependent = true
	entry({"admin", "services", "pushbotx", "setting"}, cbi("pushbotx/setting"),_("配置"), 40).leaf = true
	entry({"admin", "services", "pushbotx", "advanced"}, cbi("pushbotx/advanced"),_("高级设置"), 50).leaf = true
	entry({"admin", "services", "pushbotx", "client"}, form("pushbotx/client"), "在线设备", 80)
	entry({"admin", "services", "pushbotx", "log"}, form("pushbotx/log"),_("日志"), 99).leaf = true
	entry({"admin", "services", "pushbotx", "get_log"}, call("get_log")).leaf = true
	entry({"admin", "services", "pushbotx", "clear_log"}, call("clear_log")).leaf = true
	entry({"admin", "services", "pushbotx", "status"}, call("act_status")).leaf = true
end

function act_status()
	local e={}
	e.running=luci.sys.call("pgrep -f pushbotx >/dev/null")==0
	luci.http.prepare_content("application/json")
	luci.http.write_json(e)
end

function get_log()
	luci.http.write(luci.sys.exec(
		"[ -f '/tmp/pushbotx/pushbotx.log' ] && cat /tmp/pushbotx/pushbotx.log"))
end

function clear_log()
	luci.sys.call("echo '' > /tmp/pushbotx/pushbotx.log")
end