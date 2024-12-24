#!/bin/bash

user=$1

fail=$(grep "failed" /var/log/secure | grep "password check" | grep -E "\b$user\b" | wc -l)

while :; do
    current_fail=$(grep "failed" /var/log/secure | grep "password check" | grep -E "\b$user\b" | wc -l)
    
    if [[ $current_fail -gt $fail ]]; then
        i=1
        one_minute_later=$(date '+%b %d %H:%M' -d '1 minute')

        while true; do
            current_time=$(date '+%b %d %H:%M')

            if [[ "$current_time" > "$one_minute_later" ]]; then
                break
            fi

            current_fail=$(grep "failed" /var/log/secure | grep "password check" | grep -E "\b$user\b" | wc -l)
            
            if [[ $current_fail -gt $fail ]]; then
                echo "failed attempt of password in a minute : $i"
                ((i++))
                fail=$current_fail
            fi
            
            if [[ $i -gt 3 ]]; then
                usermod -L $user
                echo "Script locked the user until admin not unlock it"
                break
            fi

            sleep 1
        done
    fi
    
    sleep 5
done
