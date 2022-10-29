PATH="/bin:/opt/polybar-fcitx-scripts"

gdbus monitor --session --dest org.fcitx.Fcitx | grep --line-buffered / | react | sed -e 's/English (US)/EN/g;s/Mozc/JA/g'