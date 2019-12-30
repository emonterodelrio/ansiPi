#!/bin/bash
API_KEY=$( cat /home/pi/.aemet_opendata_apikey )

mkdir -p /tmp/meteotemp

cd /tmp/meteotemp

wget $(curl -s -X GET "https://opendata.aemet.es/opendata/api/mapasygraficos/mapassignificativos/esp/c/?api_key=$API_KEY" | grep "\"datos\"" | awk '{print $3}' | tr -d "," | tr -d "\"") -O temp_map_pred_0.gif

wget $(curl -s -X GET "https://opendata.aemet.es/opendata/api/mapasygraficos/mapassignificativos/esp/d/?api_key=$API_KEY" | grep "\"datos\"" | awk '{print $3}' | tr -d "," | tr -d "\"") -O temp_map_pred_1.gif

wget $(curl -s -X GET "https://opendata.aemet.es/opendata/api/mapasygraficos/mapassignificativos/esp/e/?api_key=$API_KEY" | grep "\"datos\"" | awk '{print $3}' | tr -d "," | tr -d "\"") -O temp_map_pred_2.gif

wget $(curl -s -X GET "https://opendata.aemet.es/opendata/api/mapasygraficos/mapassignificativos/esp/f/?api_key=$API_KEY" | grep "\"datos\"" | awk '{print $3}' | tr -d "," | tr -d "\"") -O temp_map_pred_3.gif

wget $(curl -s -X GET "https://opendata.aemet.es/opendata/api/mapasygraficos/analisis/?api_key=$API_KEY" | grep "\"datos\"" | awk '{print $3}' | tr -d "," | tr -d "\"") -O temp_map_meteobars_0.gif

wget $(curl -s -X GET "https://opendata.aemet.es/opendata/api/mapasygraficos/previstos/h12/?api_key=$API_KEY" | grep "\"datos\"" | awk '{print $3}' | tr -d "," | tr -d "\"") -O temp_map_meteobars_1.gif

wget $(curl -s -X GET "https://opendata.aemet.es/opendata/api/mapasygraficos/previstos/h24/?api_key=$API_KEY" | grep "\"datos\"" | awk '{print $3}' | tr -d "," | tr -d "\"") -O temp_map_meteobars_2.gif

wget $(curl -s -X GET "https://opendata.aemet.es/opendata/api/mapasygraficos/previstos/h36/?api_key=$API_KEY" | grep "\"datos\"" | awk '{print $3}' | tr -d "," | tr -d "\"") -O temp_map_meteobars_3.gif

wget $(curl -s -X GET "https://opendata.aemet.es/opendata/api/mapasygraficos/previstos/h48/?api_key=$API_KEY" | grep "\"datos\"" | awk '{print $3}' | tr -d "," | tr -d "\"") -O temp_map_meteobars_4.gif

wget $(curl -s -X GET "https://opendata.aemet.es/opendata/api/mapasygraficos/previstos/h60/?api_key=$API_KEY" | grep "\"datos\"" | awk '{print $3}' | tr -d "," | tr -d "\"") -O temp_map_meteobars_5.gif

wget $(curl -s -X GET "https://opendata.aemet.es/opendata/api/mapasygraficos/previstos/h72/?api_key=$API_KEY" | grep "\"datos\"" | awk '{print $3}' | tr -d "," | tr -d "\"") -O temp_map_meteobars_6.gif  

echo "Rotate meteobar original images"
for i in $(ls temp_map_meteobars* | grep temp); do
  convert $i -rotate 90 /var/www/html/sharedFiles/$(echo $i | cut -d"_" -f2-)
done

#echo "Cut bottom of predictions original images"
for i in $(ls temp_map_pred*); do
  echo $i | cut -d"_" -f2- | cut -d"." -f1
  mv $i /var/www/html/sharedFiles/$(echo $i | cut -d"_" -f2- | cut -d"." -f1).png
done

#Go out
cd ..
rm -r /tmp/meteotemp



echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo
echo

#Air mass
rm -r /tmp/meteoAirMasses
mkdir -p /tmp/meteoAirMasses /var/www/html/sharedFiles/airMasses/
cd /tmp/meteoAirMasses

echo "Download zip"
wget https://eumetview.eumetsat.int/static-images/MSG/RGB/AIRMASS/WESTERNEUROPE/IMAGESDisplay/24FramesAIRMASS-WESTERNEUROPE.zip -O myZip.zip
unzip -o myZip.zip
rm myZip.zip

#Change name
counter=0
for i in $(ls -r ); do
  echo "mv $i airMass_$counter.jpg and convert to png"
  mv $i airMass_$counter.jpg
#  convert airMass_$counter.jpg -quality 50 airMass_$counter.jpg
  convert airMass_$counter.jpg airMass_$counter.png
  convert airMass_$counter.png -resize 600 -colors 255 airMass_$counter.png
#  ls
  counter=$((counter+1))
done
rm *.jpg

if ! cmp --silent airMass_0.png /var/www/html/sharedFiles/airMasses/airMass_0.png; then

  cd /var/www/html/sharedFiles/airMasses/

#  #Delete 2
#  echo "Delete"
#  rm -f $(ls -v | tail -n1)
#  rm -f $(ls -v | tail -n1)

#  echo "Move 2 back images"
##  pwd
##  ls -la
#  total=$(ls | wc -l)
#  for (( i=$total; i>=1; i-- )); do
#    original=$(($i-1))
#    destiny=$(($i+1))
##    echo Antes 
##    ls -lvl
#    echo "mv ./airMass_$original.png ./airMass_$destiny.png"
#    mv ./airMass_$original.png ./airMass_$destiny.png
##    echo Despues 
##    ls -lvl
#  done

  #Move
  ls "/tmp/meteoAirMasses/"
  rm /var/www/html/sharedFiles/airMasses/*
  echo "cp /tmp/meteoAirMasses/* /var/www/html/sharedFiles/airMasses/"
  cp /tmp/meteoAirMasses/* /var/www/html/sharedFiles/airMasses/
fi

echo "Delete files older than 2 days"
echo $(find /var/www/html/sharedFiles/airMasses/ -type f -mtime +1 -exec rm {} \;)  
find /var/www/html/sharedFiles/airMasses/ -type f -mtime +1 -exec rm {} \;

