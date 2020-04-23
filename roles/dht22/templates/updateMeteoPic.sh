#!/bin/bash
API_KEY=$( cat /home/pi/.aemet_opendata_apikey )


##Prediction
#rm -r /tmp/prediction_tmp
#mkdir -p /var/www/html/sharedFiles/prediction /tmp/prediction_tmp
#cd /tmp/prediction_tmp

#wget $(curl -s -X GET "https://opendata.aemet.es/opendata/api/mapasygraficos/mapassignificativos/esp/c/?api_key=$API_KEY" | grep "\"datos\"" | awk '{print $3}' | tr -d "," | tr -d "\"") -O tmp_pred_0.gif
#wget $(curl -s -X GET "https://opendata.aemet.es/opendata/api/mapasygraficos/mapassignificativos/esp/d/?api_key=$API_KEY" | grep "\"datos\"" | awk '{print $3}' | tr -d "," | tr -d "\"") -O tmp_pred_1.gif
#wget $(curl -s -X GET "https://opendata.aemet.es/opendata/api/mapasygraficos/mapassignificativos/esp/e/?api_key=$API_KEY" | grep "\"datos\"" | awk '{print $3}' | tr -d "," | tr -d "\"") -O tmp_pred_2.gif
#wget $(curl -s -X GET "https://opendata.aemet.es/opendata/api/mapasygraficos/mapassignificativos/esp/f/?api_key=$API_KEY" | grep "\"datos\"" | awk '{print $3}' | tr -d "," | tr -d "\"") -O tmp_pred_3.gif





#Meteobar
rm -r /tmp/meteobar_tmp
mkdir -p /var/www/html/sharedFiles/meteobar /tmp/meteobar_tmp
cd /tmp/meteobar_tmp

wget $(curl -s -X GET "https://opendata.aemet.es/opendata/api/mapasygraficos/analisis/?api_key=$API_KEY" | grep "\"datos\"" | awk '{print $3}' | tr -d "," | tr -d "\"") -O tmp_meteobar_0.gif
wget $(curl -s -X GET "https://opendata.aemet.es/opendata/api/mapasygraficos/previstos/h12/?api_key=$API_KEY" | grep "\"datos\"" | awk '{print $3}' | tr -d "," | tr -d "\"") -O tmp_meteobar_1.gif
wget $(curl -s -X GET "https://opendata.aemet.es/opendata/api/mapasygraficos/previstos/h24/?api_key=$API_KEY" | grep "\"datos\"" | awk '{print $3}' | tr -d "," | tr -d "\"") -O tmp_meteobar_2.gif
wget $(curl -s -X GET "https://opendata.aemet.es/opendata/api/mapasygraficos/previstos/h36/?api_key=$API_KEY" | grep "\"datos\"" | awk '{print $3}' | tr -d "," | tr -d "\"") -O tmp_meteobar_3.gif
wget $(curl -s -X GET "https://opendata.aemet.es/opendata/api/mapasygraficos/previstos/h48/?api_key=$API_KEY" | grep "\"datos\"" | awk '{print $3}' | tr -d "," | tr -d "\"") -O tmp_meteobar_4.gif
wget $(curl -s -X GET "https://opendata.aemet.es/opendata/api/mapasygraficos/previstos/h60/?api_key=$API_KEY" | grep "\"datos\"" | awk '{print $3}' | tr -d "," | tr -d "\"") -O tmp_meteobar_5.gif
wget $(curl -s -X GET "https://opendata.aemet.es/opendata/api/mapasygraficos/previstos/h72/?api_key=$API_KEY" | grep "\"datos\"" | awk '{print $3}' | tr -d "," | tr -d "\"") -O tmp_meteobar_6.gif  

echo "Rotate meteobar original images"
for i in $(ls tmp_meteobar* | grep tmp); do
  convert $i -rotate 90 /var/www/html/sharedFiles/meteobar/$(echo $i | cut -d"_" -f2-)
done


#Air mass
rm -r /tmp/airMass_tmp
mkdir -p /var/www/html/sharedFiles/airMass /tmp/airMass_tmp
cd /tmp/airMass_tmp

echo "Download zip"
wget https://eumetview.eumetsat.int/static-images/MSG/RGB/AIRMASS/WESTERNEUROPE/IMAGESDisplay/24FramesAIRMASS-WESTERNEUROPE.zip -O airMass.zip;
unzip -o airMass.zip;
rm airMass.zip $(ls | head -n 1)

it=0
for i in $(ls); do
  echo "mv $i /var/www/html/sharedFiles/airMass/airMass_$it.jpg"
  convert $i -strip -quality 60 /var/www/html/sharedFiles/airMass/airMass_$it.jpg
  ((it++))
done
