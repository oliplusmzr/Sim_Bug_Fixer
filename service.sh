#!/system/bin/sh
MODDIR=${0%/*}
LOGTAG="SIM_FIX"
LOGFILE="/sdcard/simfix_log.txt"
LOGDATE="/sdcard/simfix_log_date.txt"
TODAY=$(date +%Y-%m-%d)

if [ ! -f "$LOGDATE" ] || [ "$(cat $LOGDATE)" != "$TODAY" ]; then
    echo "$TODAY" > "$LOGDATE"
    echo "=== $TODAY ===" > "$LOGFILE"
fi

log -p i -t $LOGTAG "Service Started."

while true; do
    CALL_STATE=$(dumpsys telephony.registry | grep -m 1 'mCallState=' | awk -F= '{print $2}' | tr -d '\r')

    if [ "$CALL_STATE" = "0" ]; then
        log -p i -t $LOGTAG "No call, running simfix.sh"
        echo "$(date) - SIMFIX worked (No call)" >> $LOGFILE
        sh "$MODDIR/simfix.sh"
        sleep 18000
    else
        log -p i -t $LOGTAG "Phone Call active, waiting..."
        echo "$(date) - There was a phone call, canceling simfix" >> $LOGFILE
        sleep 60
    fi
done
