#!/bin/bash

fping --quiet --count 20 --period 200 --timeout 2000 -f speedtest-hosts.txt 2>&1 \
  | tee result.fping.txt


echo "url.host,url,size_download,speed_download,time_starttransfer,time_total" > result.curl.csv
for i in $(cat speedtest-urls.txt) ; do
  curl -o/dev/null -s \
    -w "%{url.host},%{url},%{size_download},%{speed_download},%{time_starttransfer},%{time_total}\n"\
    "$i"
done | tee -a result.curl.csv
