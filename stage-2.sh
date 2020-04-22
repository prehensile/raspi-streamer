## install & setup streaming software after first reboot

# run chromium when lxsession starts
LAUNCHER_SCRIPT="chromium-launcher.sh" 
mkdir -p ~/.config/lxsession/LXDE-pi
echo "@$HOME/$LAUNCHER_SCRIPT" > ~/.config/lxsession/LXDE-pi/autostart
cp /boot/$LAUNCHER_SCRIPT ~/
chmod +x ~/$LAUNCHER_SCRIPT

sudo -s <<HEREDOC
# install widevine plugin
# see https://blog.vpetkov.net/2019/07/12/netflix-and-spotify-on-a-raspberry-pi-4-with-latest-default-chromium/
cd /usr/lib/chromium-browser
wget http://blog.vpetkov.net/wp-content/uploads/2019/09/libwidevinecdm.so_.zip
unzip libwidevinecdm.so_.zip && chmod 755 libwidevinecdm.so
rm libwidevinecdm.so_.zip

# install shairport
sudo apt install shairport-sync

# reboot every night
echo "03 05 * * * reboot" | crontab

# reboot
reboot
HEREDOC
