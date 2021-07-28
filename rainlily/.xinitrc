xrandr --output DisplayPort-0 --primary --mode 2560x1080 --rate 144 --pos 1080x1080 --rotate normal --set TearFree on --output HDMI-A-0 --mode 1920x1080 --rate 75 --pos 1400x0 --rotate normal --set TearFree on --output DVI-D-0 --mode 1920x1080 --rate 60 --pos 0x660 --rotate left --set TearFree on 

xrdb -merge ~/.Xresources &&
xsetroot -cursor_name left_ptr &

/usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &
openrgb -p test.orp &
scream -o alsa -i virbr0 & 

export _JAVA_AWT_WM_NONREPARENTING=1
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

xset -dpms
xset s off

export QT_QPA_PLATFORMTHEME=gtk2

/usr/lib/kdeconnectd &
sxhkd &
exec bspwm