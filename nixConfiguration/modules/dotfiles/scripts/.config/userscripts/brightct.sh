ddcutil getvcp 10 | grep -oP '(?<=:).*' | grep -o '[0-9]*' | head -n 1
