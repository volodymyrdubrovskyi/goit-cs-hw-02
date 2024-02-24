#!/bin/bash

echo "Check start..."

sitearray=("https://google.com" "https://facebook.com" "https://twitter.com" "https://odnoklassniki.ru")

logfile="sitestat.log"
> "$logfile"

for site in "${sitearray[@]}"
do
    if curl -s -L --head --connect-timeout 2 --request GET -w "%{http_code}\n" "$site" | grep "^200$" > /dev/null
    then
        echo "$site is UP" >> "$logfile"
    else
        echo "$site is DOWN" >> "$logfile"
    fi
done

echo "Check done. Results in $logfile"
