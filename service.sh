#!/system/bin/sh
MODDIR=${0%/*}

# Sonsuz döngü: her 5 saatte bir çalışacak
while true; do
  # Telefon görüşme kontrolü
  in_call=$(dumpsys telephony.registry | grep -i "mCallState=2")
  if [ -z "$in_call" ]; then
    log -p i -t SIM_FIX "Telefon boşta, işlem başlatılıyor..."
    sh $MODDIR/simfix.sh
  else
    log -p i -t SIM_FIX "Görüşme tespit edildi, işlem ertelendi."
  fi

  # 5 saat bekle (18000 saniye)
  sleep 18000
done