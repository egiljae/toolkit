#! /bin/bash
# Sets the fan speed to a decent level

if (( $# != 1)); then
    echo "Usage: $basename --[silence|blast]"
fi

if command -v fancontrol &> /dev/null; then
    sudo service fancontrol stop &> /dev/null
fi 

if [[ $1 == "--silence" ]]; then
    echo -n "Fan PWM set to: " 
    echo 120 | sudo tee /sys/class/hwmon/hwmon1/device/pwm1
elif [[ $1 == "--blast" ]]; then
    echo -n "Fan PWM set to: " 
    echo 255 | sudo tee /sys/class/hwmon/hwmon1/device/pwm1
else
    echo "No mode set, exiting.."
    exit 1
fi

echo -n "Waiting 5 sec to stabilize fans: "
echo -n "5"
sleep 1
echo -n " 4"
sleep 1
echo -n " 3"
sleep 1
echo -n " 2"
sleep 1
echo " 1"
sleep 1
sensors | grep fan
