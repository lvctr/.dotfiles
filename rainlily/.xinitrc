/home/insti/.scripts/display.sh &

xrdb -merge ~/.Xresources &&
xsetroot -cursor_name left_ptr &

/usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &
openrgb -p test2.orp &

export _JAVA_AWT_WM_NONREPARENTING=1
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

export QT_QPA_PLATFORMTHEME=gtk2

eval $(gnome-keyring-daemon --start)
export SSH_AUTH_SOCK

/usr/lib/kdeconnectd &
sxhkd &
exec bspwm
