#!/system/bin/sh

LOGFILE="/sdcard/simfix_log.txt"

{
  echo "====== $(date) ======"
  echo "SIM reset başlatıldı."
} >> $LOGFILE

svc data disable
sleep 1
svc data enable
stop ril-daemon
sleep 1
start ril-daemon

echo "SIM reset tamamlandı." >> $LOGFILE
echo "" >> $LOGFILE

log -p i -t SIM_FIX "SIM reset işlemi yapıldı, log yazıldı."
