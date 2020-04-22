## run this on pi to do some basic setup
sudo -s <<HEREDOC
raspi-config nonint do_hostname streampi
## set screen resolution to 1024x768
raspi-config nonint do_resolution 2 16
## enable VNC server
raspi-config nonint do_vnc 0
## boot to GUI, autologin
raspi-config nonint do_boot_behaviour B4
raspi-config nonint do_expand_rootfs
reboot
HEREDOC
