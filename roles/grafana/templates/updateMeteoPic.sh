#!/bin/bash
#!/bin/bash
API_KEY=$( cat {{ grafana.meteoUpdatePicturesPath }}/api_key )

wget $(curl -s -X GET "https://opendata.aemet.es/opendata/api/mapasygraficos/analisis?api_key=$API_KEY" | grep "\"datos\"" | awk '{print $3}' | tr -d "," | tr -d "\"") -O /var/www/html/sharedFiles/map_meteobar.gif