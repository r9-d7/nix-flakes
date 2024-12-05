STATE=`ddcutil getvcp 10 | grep -oP '(?<=:).*' | grep -o '[0-9]*' | head -n 1`
if [[ $STATE == '100' ]] then
    ddcutil --display 1 setvcp 10 5
    ddcutil --display 2 setvcp 10 5
else
    ddcutil --display 1 setvcp 10 100
    ddcutil --display 2 setvcp 10 100
fi
