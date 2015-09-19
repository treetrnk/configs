#!/bin/sh


wm=i3


#--------ALL--------#
#udiskie &
#udisksvm &
#thunar-volman &
#mpd
killall devmon
devmon &
xset +fp '/usr/share/fonts/local'
xset fp rehash
xflux -z 17036 -k 3000 &
xbindkeys

case $wm in
  awesome)  #--------AWESOME--------#
    synclient TapButton1=0 
    synclient TapButton2=0 
    synclient TapButton3=0 
    /home/nathan/.scripts/rdm-wallpaper.sh &
    /home/nathan/.scripts/batNoti.sh &
    volumeicon &
    xfce4-power-manager &
    exec awesome 
    ;;
  dwm) #--------DWM--------#
    /home/nathan/.scripts/rdm-wallpaper.sh &
    /home/nathan/.scripts/batNoti.sh &
    dropboxd &
    set statusbar
    /home/nathan/.scripsts/reconk.sh &
    roxterm &
    roxterm &
    xfce4-power-manager &
    # wicd-gtk -t &
    volume-icon &
    xscreensaver -no-splash &
    xterm -e ranger & 
    exec dwm
    ;;
  i3) #--------i3--------#
    synclient TapButton1=0 
    synclient TapButton2=0 
    synclient TapButton3=0 
    synclient HorizTwoFingerScroll=1
    #/home/nathan/.scripts/rdm-wallpaper.sh &
    #/home/nathan/.scripts/batNoti.sh &
    #wicd-gtk -t &
    #nm-applet &
    #xfce4-power-manager &
    #xscreensaver -no-splash &
    exec i3
    ;;
  JWM) #--------JWM--------#
    xfce4-power-manager &
    volumeicon &
    wicd-gtk -t &
    xscreensaver -no-splash &
    exec jwm
    ;;
  lxde) #--------LXDE--------#
    xfce4-power-manager &
    volumeicon &
    exec startlxde
    ;;
  openbox) #--------OPENBOX---------#
    pypanel &
    wicd-gtk -t &
    volumeicon &
    /home/nathan/.scripts/rdm-wallpaper.sh &
    xfce4-power-manager &
    xscreensaver -no-splash &
    exec openbox-session 
    ;;
  xfce4) #--------XFCE4---------#
    volumeicon &
    #/home/nathan/.scripts/rdm-wallpaper.sh &
    exec startxfce4 #--with-ck-launch 
    ;;
  gdm) #--------GDM----------#
    exec gnome-session
    ;;
  esac

#--------MISC--------#
: '
exec feh --bg-fill images/wallpapers/pine.jpg &

while true ; do
    xsetroot -name "| $(date +"%a. %b %e,%l:%M %P") | $(acpi -b | awk 'sub(/,/,"") {print $3, $4}')"
    sleep 10s
done &

xautolock -time 11 -locker "sudo pm-suspend" &
pnmixer & 
'
