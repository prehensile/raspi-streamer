## install & setup streaming software after first reboot

# run chromium when lxsession starts
LAUNCHER_SCRIPT="chromium-launcher.sh" 
mkdir -p ~/.config/lxsession/LXDE-pi
echo "@$HOME/$LAUNCHER_SCRIPT" > ~/.config/lxsession/LXDE-pi/autostart
cp /boot/$LAUNCHER_SCRIPT ~/
chmod +x ~/$LAUNCHER_SCRIPT

sudo -s <<HEREDOC
# install widevine plugin
# see https://blog.vpetkov.net/2020/03/30/raspberry-pi-netflix-one-line-easy-install-along-with-hulu-amazon-prime-disney-plus-hbo-spotify-pandora-and-many-others/
cd /tmp
wget -q --no-check-certificate https://pi.vpetkov.net/libwidevinecdm.so_.zip
unzip -q libwidevinecdm.so_.zip && chmod 755 libwidevinecdm.so && rm -f libwidevinecdm.so_.zip
mv -f libwidevinecdm.so /usr/lib/chromium-browser

# install shairport
sudo apt install shairport-sync

# reboot every night
echo "03 05 * * * root reboot" > /etc/cron.d/reboot_daily

# reboot
reboot
HEREDOC
