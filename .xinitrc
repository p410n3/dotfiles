setsid /home/palone/Scripts/dwmStatus.sh &

compton --config /home/palone/.config/compton.conf -b

nitrogen --restore

exec dwm
