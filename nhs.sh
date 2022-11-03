#!/bin/bash

curl -s -H "Authorization: Basic YourHashHere" "http://192.168.1.169:2001/status" | \
        iconv -f iso8859-1 -t utf-8 | \
        grep '<tr><td' | \
        sed -e 's/^.*<strong>//g' -e 's/<\/td><\/tr>//g' -e 's/<.*>//g' -e 's/ V$//g' -e 's/ %$//g' | \
        sed '1 s/^Estado/Estado Entrada/' | \
        sed '5 s/^Estado/Estado Saída/' | \
        sed '8 s/^Estado/Estado Bateria/' | \
        sed -e 's/ /_/g' | \
        awk -F: '{print "nhs.get[\""$1"\"] TIMESTAMP \"" $2"\""}' | \
        sed -e 's/^/\"p99" /g' -e "s/TIMESTAMP/$(date '+%s')/g" > /var/tmp/nhs.get

zabbix_sender -z 192.168.1.198 -i /var/tmp/nhs.get -T -vv