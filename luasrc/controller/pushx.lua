module("luci.controller.pushx",package.seeall)

function index()
	if not nixio.fs.access("/etc/config/pushx") then
		return
	end

	entry({"admin", "services", "pushx"}, alias("admin", "services", "pushx", "setting"),_("推送X"), 30).dependent = true
	entry({"admin", "services", "pushx", "setting"}, cbi("pushx/setting"),_("配置"), 40).leaf = true
	entry({"admin", "services", "pushx", "advanced"}, cbi("pushx/advanced"),_("高级设置"), 50).leaf = true
	entry({"admin", "services", "pushx", "client"}, form("pushx/client"), "在线设备", 80)
	entry({"admin", "services", "pushx", "log"}, form("pushx/log"),_("日志"), 99).leaf = true
	entry({"admin", "services", "pushx", "get_log"}, call("get_log")).leaf = true
	entry({"admin", "services", "pushx", "clear_log"}, call("clear_log")).leaf = true
	entry({"admin", "services", "pushx", "status"}, call("act_status")).leaf = true
end

function act_status()
	local e={}
	e.running=luci.sys.call("pgrep -f pushx >/dev/null")==0
	luci.http.prepare_content("application/json")
	luci.http.write_json(e)
end

function get_log()
	luci.http.write(luci.sys.exec(
		"[ -f '/tmp/pushx/pushx.log' ] && cat /tmp/pushx/pushx.log"))
end

function clear_log()
	luci.sys.call("echo '' > /tmp/pushx/pushx.log")
end