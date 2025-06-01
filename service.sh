#!/system/bin/sh
# SIM Bug Fix - Service Script

MODDIR=${0%/*}
LOGTAG="SIM_FIX"
LOGFILE="/sdcard/simfix_log.txt"

log -p i -t $LOGTAG "Servis başlatıldı."

while true; do
    # mCallState=2 → aktif görüşme, mCallState=0 → görüşme yok
    CALL_STATE=$(dumpsys telephony.registry | grep -m 1 'mCallState=' | awk -F= '{print $2}' | tr -d '\r')

    if [ "$CALL_STATE" = "0" ]; then
        log -p i -t $LOGTAG "Görüşme yok, simfix.sh çalıştırılıyor."
        echo "$(date) - SIMFIX çalıştı (Görüşme yok)" >> $LOGFILE
        sh "$MODDIR/simfix.sh"
        sleep 18000  # 5 saat uyku
    else
        log -p i -t $LOGTAG "Görüşme aktif, bekleniyor..."
        echo "$(date) - Görüşme vardı, simfix iptal" >> $LOGFILE
        sleep 60
    fi
done
