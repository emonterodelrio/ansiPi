#!/bin/bash
API_KEY=$( cat {{ grafana.meteoUpdatePicturesPath }}/api_key )

cd /var/www/html/sharedFiles/

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
  convert $i -rotate 90 $(echo $i | cut -d"_" -f2-)
done

echo "Cut bottom of predictions original images"
for i in $(ls temp_map_pred*); do
  echo $i | cut -d"_" -f2- | cut -d"." -f1
  convert -crop 500x333 $i mv $(echo $i | cut -d"_" -f2- | cut -d"." -f1).jpg
  echo $i | cut -d"_" -f2- | cut -d"." -f1
  mv $(echo $i | cut -d"_" -f2- | cut -d"." -f1)-0.jpg $(echo $i | cut -d"_" -f2- | cut -d"." -f1).jpg
  rm $(echo $i | cut -d"_" -f2- | cut -d"." -f1)-*.jpg
done

rm temp_*
