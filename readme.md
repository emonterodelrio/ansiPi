### Welcome to ansipi

## This repo is an attempt to simple/quick/no-attention-required install/configure/update your raspberry pi for multiple purpouses like

# metopi

Monitors humidity and temperature and shows a nice dashboard with aemet forecast info.

This is the central server, it requires a powerfull raspberry like [Raspberry Pi Model 3b](https://www.raspberrypi.org/products/raspberry-pi-3-model-b/), you'll appreciate it :p

**Requirements:**

* [dht22 sensor, the white one] (https://www.amazon.es/s/ref=sr_st_review-rank?keywords=dht22+sensor&sort=review-rank)

* Create an account at [Aemet](https://opendata.aemet.es)

* Create an account at [Duckdns](https://duckdns.org)

* Create an account at google if haven't yet

**Installation:**


1-. [Download your image to SD card](https://drive.google.com/file/d/19iTuE1imGfB20s8R8KZgfg1UanPMVt46/view?usp=sharing)

2-. Load your image to SD card

<pre>sudo umount /media/....</pre>

<pre>sudo dd if=my-2022-04-04-raspios-bullseye-armhf.img of=/dev/mmcblk0 bs=4M conv=fsync status=progress</pre>

<pre>sync</pre>

3-. Connect hdmi and a mouse/keyboard

4-. Power on your raspberry

5-. find your raspberry pi at network:

    nmap -sP 192.168.1.1/24

6-. Setup ip and password properly at conf/inventory/inventory file

7-. Launch install with that ip and follow instructions:

    ./install_meteopi.sh RASPBERRYPI_IP

9-. Reaching meteopi from the internet requires you to open router 80 port to configured [ip](https://github.com/emonterodelrio/ansiPi/blob/develop/vars/piStuff.yaml#L8)


