# luci-app-PushX

> 基于 [tty228/luci-app-serverchan](https://github.com/tty228/luci-app-serverchan) 修改的 OpenWrt 全能推送插件。

## 与原版的主要区别

- **流量检测**：由 `wrtbwmon` 改为 **[Bandix](https://github.com/timsaya/openwrt-bandix)**，实时获取设备流量数据
- **设备在线检测**：适配 Bandix API 接口

## 支持推送平台

- 钉钉机器人
- 企业微信机器人
- PushPlus
- Server酱
- 飞书机器人
- Bark
- PushDeer
- 自定义 JSON

## 功能特性

- 设备上线/下线通知
- 设备流量异常预警
- 定时推送（设备列表、系统状态、WAN 信息、温度等）
- CPU 负载 / 温度监控
- 免打扰时段
- 外网 IP 变化通知

## 编译

通过 GitHub Actions 自动编译，支持 workflow_dispatch 手动触发。

编译产物：`luci-app-pushx_*.ipk`

## 安装

```bash
# 安装 ipk
opkg install luci-app-pushx_*.ipk

# 确保 Bandix 已运行
/etc/init.d/bandix enable
/etc/init.d/bandix start
```

安装后进入 LuCI → **服务 → 推送X** 进行配置。

## 依赖

- `bandix` — 流量统计后端
- `curl`
- `jq`
- `iputils-arping`

## 致谢

- [tty228/luci-app-serverchan](https://github.com/tty228/luci-app-serverchan) — 原始项目
- [timsaya/openwrt-bandix](https://github.com/timsaya/openwrt-bandix) — 流量统计后端

## License

MIT