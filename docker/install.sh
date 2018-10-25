#ª/bin/bash
sudo apt-get install qemu-user-static
echo "Looking for raspi image at /home/emontero/Descargas/images"
docker run -it --rm --privileged=true -v /home/emontero/Descargas/images:/usr/rpi/images -w /usr/rpi ryankurte/docker-rpi-emu /bin/bash -c './run.sh images/*.img /bin/bash'
