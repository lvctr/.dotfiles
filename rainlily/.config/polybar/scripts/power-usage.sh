

echo $((`cat /sys/class/hwmon/hwmon*/power1_input` / 1000000)) | bc | awk '{print "  "$1" W "}'