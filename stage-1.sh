## run this on pi to do some basic setup
sudo -s <<HEREDOC
# set screen resolution
sed -i 's/.*hdmi_mode=.*/hdmi_mode=16/' /boot/config.txt 
sed -i 's/.*hdmi_group=.*/hdmi_group=2/' /boot/config.txt
# automate some config
raspi_config nonint do_hostname streampi
raspi-config nonint do_vnc 0
raspi-config nonint do_boot_behaviour B4
raspi-config nonint do_expand_rootfs
reboot
HEREDOC