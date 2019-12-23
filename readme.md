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

* Create an account at Lastpass if haven't yet

**Installation:**


1-. [Load your image to SD card](https://www.raspberrypi.org/documentation/installation/installing-images/)

2-. Connect hdmi and a mouse/keyboard

3-. Power on your raspberry

4-. Start GUI typing <pre>startx</pre> at terminal prompt, if not started by default

4-. Follow first-time-menu prompts for initial setup of your raspberry pi:
    Setup country, Language, Timezone...
    Setup password, must be the same you setup at install_meteopi.sh
    Setup wifi connection

5-. Open a terminal (Ctrl+Alt+t) and run <pre>raspi-config</pre> and edit some settings:
   
    Enable ssh at: Interfacing options -> SSH

    Enable autologin to console mode at: Boot options -> Desktop/Cli -> Console autologin

    Expand filesystem at: Advanced options -> Expand filesystem

6-. find your raspberry pi at network:

    nmap -sP 192.168.1.1/24

7-. Setup ip and password properly at conf/inventory file

8-. Launch install with that ip and follow instructions:

    ./install_meteopi.sh 192.168.1.38

9-. Reaching meteopi from the internet requires you to open router 80 port to 192.168.1.11


