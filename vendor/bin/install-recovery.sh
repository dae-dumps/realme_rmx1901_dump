#!/vendor/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:67108864:a5c5fa248d03b66647bedf94216d954c476d9ab8; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:0878d22d96d7404773a7b794d64f10e998dbf70d \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:67108864:a5c5fa248d03b66647bedf94216d954c476d9ab8 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.boot.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.boot.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.boot.recovery.updated true
fi
