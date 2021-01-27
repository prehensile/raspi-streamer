## install & setup streaming software after first reboot

# python selenium dependencies
sudo apt-get install chromium-chromedriver

# run chromium when session starts
LAUNCHER_SCRIPT="chromium-launcher.sh" 
APP_SCRIPT="chromium-launcher.py"

cp /boot/$LAUNCHER_SCRIPT ~/
chmod +x ~/$LAUNCHER_SCRIPT
cp /boot/$APP_SCRIPT ~/
chmod +x ~/$APP_SCRIPT

PTH_CONFIG_SOURCE=/etc/xdg/lxsession/LXDE-pi
PTH_CONFIG_NEW=$PTH_USER_LXSESSION/LXDE-pi
PTH_USER_LXSESSION=~/.config/lxsession
mkdir $PTH_USER_LXSESSION
cp -R $PTH_CONFIG_SOURCE $PTH_USER_LXSESSION
rm $PTH_CONFIG_NEW/desktop.conf $PTH_CONFIG_NEW/sshpwd.sh
echo "@$HOME/$LAUNCHER_SCRIPT" $PTH_CONFIG_NEW/autostart

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
echo "03 05 * * * root /sbin/reboot" > /etc/cron.d/reboot_daily

# reboot
reboot
HEREDOC
