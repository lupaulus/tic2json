#!/bin/bash
stty -F /dev/ttyr00 1200 raw evenp
stdbuf -oL tic2json -P -dr < /dev/ttyr00 | while read line; do echo "$line" | curl -i --trace-ascii - -H "Content-Type:application/json" -XPOST 'http://127.0.0.1:8090/telegraf' --data-binary @- ; done

