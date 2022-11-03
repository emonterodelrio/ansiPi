#!/bin/bash
sudo kill -9 $()ps aux | grep "piCam" | grep -v grep | awk '{print $2}')