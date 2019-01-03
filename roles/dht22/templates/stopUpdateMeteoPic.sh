#!/bin/bash
for i in $(ps aux | grep "updateMeteoPic.sh" | grep -v grep | awk '{print $2}'); do
  sudo kill -9 $i
done
