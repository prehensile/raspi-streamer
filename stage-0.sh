# run on host machine to prepare SD card
BOOT_VOLUME=/media/prehensile/boot
cp wpa_supplicant.conf $BOOT_VOLUME
touch $BOOT_VOLUME/ssh
cp stage-1.sh $BOOT_VOLUME
cp stage-2.sh $BOOT_VOLUME