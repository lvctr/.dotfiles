xrandr --output eDP --set TearFree on

xrdb -merge ~/.Xresources &&
xsetroot -cursor_name left_ptr &
setxkbmap -option caps:swapescape &
xset b off &

export _JAVA_AWT_WM_NONREPARENTING=1
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

export QT_QPA_PLATFORMTHEME=gtk2

/usr/lib/mate-polkit/polkit-mate-authentication-agent-1 &
/usr/lib/kdeconnectd &

sxhkd &
exec bspwm
