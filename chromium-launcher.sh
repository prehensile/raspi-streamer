# chromium-browser --user-agent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36" https://open.spotify.com/ 
# python3 chromium-launcher.py

#USER_AGENT='Mozilla/5.0 (X11; CrOS armv7l 12371.89.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36'
#BROWSER_COMMAND = 'chromium-browser %U --autoplay-policy=no-user-gesture-required --user-agent="$USER_AGENT"'
BROWSER_COMMAND='gtk-launch chromium-media-browser'

$BROWSER_COMMAND
sleep 5
pkill chromium
$BROWSER_COMMAND
