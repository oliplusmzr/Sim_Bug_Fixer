#!/system/bin/sh
log -p i -t SIM_FIX "SIM reset başlıyor..."

svc data disable
sleep 1
svc data enable
stop ril-daemon
sleep 1
start ril-daemon

log -p i -t SIM_FIX "SIM reset tamamlandı."