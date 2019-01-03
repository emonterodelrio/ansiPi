#!/bin/bash

function setupDashHeaders() {
#Create dashboard json temp file
cat >$BASE_PATH/temp.json <<EOL
{
  "folderId": 0,
  "overwrite": true,
  "dashboard": {
    "uid": "$DASHBOARD_TITLE",
    "title": "$DASHBOARD_TITLE",
    "tags": [],
    "timezone": "browser",
    "schemaVersion": 16,
    "version": 0,
    "editable": true,
    "gnetId": null,
    "graphTooltip": 0,
    "links": [],
EOL
}

function setupDashAemetMeteobars() {
#Create dashboard json temp file
cat >>$BASE_PATH/temp.json <<EOL
      {
        "content": "<style>\n\n.forward {\n  position: absolute;\n  bottom: 10%;\n  left: 19%;\n  color: #8b00b2;\n  font-weight: bold;\n}\n\n.back {\n  position: absolute;\n  bottom: 10%;\n  left: 7%;\n  color: #8b00b2;\n  font-weight: bold;\n}\n\n.mymeteobars {\n  display: none;\n}\n\n.meteobars_txt {\n  position: absolute;\n  bottom: 10%;\n  left: 10%;\n  color: #0000aa;\n  font-weight: bold;\n}\n\n.meteobars_img {\n  margin:-3% 0 0 0;\n}\n\n.meteobars_slideshow-container {\n  max-width: 1000px;\n  position: relative;\n  margin: auto;\n}\n\n.meteobars_fade {\n  -webkit-animation-name: fade;\n  -webkit-animation-duration: 0.2s;\n  animation-name: fade;\n  animation-duration: 0.2s;\n}\n\n@-webkit-keyframes meteobars_fade {\n  from {opacity: .4} \n  to {opacity: 1}\n}\n\n@keyframes meteobars_fade {\n  from {opacity: .4} \n  to {opacity: 1}\n}\n\n@media only screen and (max-width: 500px) {\n  .meteobars_text {font-size: 11px}\n}\n\n</style>\n\n<div class=\"meteobars_slideshow-container\">\n\n  <div class=\"mymeteobars meteobars_fade\">\n    <img class=\"meteobars_img\" src=\"/sharedFiles/map_meteobars_0.gif\" alt=\"\">\n    <span class=\"meteobars_txt\">Now</span><span class=\"forward\">+</span>\n  </div>\n\n  <div class=\"mymeteobars meteobars_fade\">\n    <img class=\"meteobars_img\" src=\"/sharedFiles/map_meteobars_1.gif\" alt=\"\">\n    <span class=\"back\">-</span><span class=\"meteobars_txt\">12h</span><span class=\"forward\">+</span>\n  </div>\n\n  <div class=\"mymeteobars meteobars_fade\">\n    <img class=\"meteobars_img\" src=\"/sharedFiles/map_meteobars_2.gif\" alt=\"\">\n    <span class=\"back\">-</span><span class=\"meteobars_txt\">24h</span><span class=\"forward\">+</span>\n  </div>\n\n  <div class=\"mymeteobars meteobars_fade\">\n    <img class=\"meteobars_img\" src=\"/sharedFiles/map_meteobars_3.gif\" alt=\"\">\n    <span class=\"back\">-</span><span class=\"meteobars_txt\">36h</span><span class=\"forward\">+</span>\n  </div>\n\n  <div class=\"mymeteobars meteobars_fade\">\n    <img class=\"meteobars_img\" src=\"/sharedFiles/map_meteobars_4.gif\" alt=\"\">\n    <span class=\"back\">-</span><span class=\"meteobars_txt\">48h</span><span class=\"forward\">+</span>\n  </div>\n\n  <div class=\"mymeteobars meteobars_fade\">\n    <img class=\"meteobars_img\" src=\"/sharedFiles/map_meteobars_5.gif\" alt=\"\">\n    <span class=\"back\">-</span><span class=\"meteobars_txt\">60h</span><span class=\"forward\">+</span>\n  </div>\n\n  <div class=\"mymeteobars meteobars_fade\">\n    <img class=\"meteobars_img\" src=\"/sharedFiles/map_meteobars_6.gif\" alt=\"\">\n    <span class=\"back\">-</span><span class=\"meteobars_txt\">72h</span>\n  </div>\n\n</div>\n\n<script>\nvar meteobar_slideIndex = 0;\nmeteobar_showSlides()\n\nfunction meteobar_showSlides() {\n  var meteobar_i;\n  var meteobar_slides = document.getElementsByClassName(\"mymeteobars\");\n  for (meteobar_i = 0; meteobar_i < meteobar_slides.length; meteobar_i++) {\n    meteobar_slides[meteobar_i].style.display = \"none\";  \n  }\n\n  if (meteobar_slideIndex >= meteobar_slides.length) {\n    meteobar_slideIndex = 0\n  }\n\n  meteobar_slides[meteobar_slideIndex].style.display = \"block\";\n\n  if (meteobar_slideIndex == 0) {\n    meteobar_slideIndex++;\n    setTimeout(meteobar_showSlides, 3000);\n  }else{\n    meteobar_slideIndex++;\n    setTimeout(meteobar_showSlides, 400);\n  }\n}\n\n</script>",
        "gridPos": {
          "h": 7,
          "w": 7,
          "x": 0,
          "y": 0
        },
        "id": 1,
        "links": [],
        "mode": "html",
        "title": "",
        "transparent": true,
        "type": "text"
      },
EOL
}

function setupDashAemetPrediction() {
#Create dashboard json temp file
cat >>$BASE_PATH/temp.json <<EOL
      {
        "content": "<style>\n\n.mypredictions {\n  display: none;\n}\n\n.predictions_txt {\n  position: absolute;\n  bottom: 21%;\n  right: 5%;\n  color: #0000aa;\n  font-weight: bold;\n}\n\n.predictions_img {\n  margin:0 0 0 0;\n}\n\n.predictions_slideshow-container {\n  max-width: 1000px;\n  position: relative;\n  margin: auto;\n}\n\n.predictions_fade {\n  -webkit-animation-name: fade;\n  -webkit-animation-duration: 0.2s;\n  animation-name: fade;\n  animation-duration: 0.2s;\n}\n\n@-webkit-keyframes predictions_fade {\n  from {opacity: .7} \n  to {opacity: 1}\n}\n\n@keyframes predictions_fade {\n  from {opacity: .7} \n  to {opacity: 1}\n}\n\n@media only screen and (max-width: 500px) {\n  .predictions_text {font-size: 11px}\n}\n\n</style>\n\n<div class=\"predictions_slideshow-container\">\n\n  <div class=\"mypredictions predictions_fade\">\n    <img class=\"predictions_img\" src=\"/sharedFiles/map_pred_0.jpg\" alt=\"\">\n    <span class=\"predictions_txt\">Now</span>\n  </div>\n\n  <div class=\"mypredictions predictions_fade\">\n    <img class=\"predictions_img\" src=\"/sharedFiles/map_pred_1.jpg\" alt=\"\">\n    <span class=\"predictions_txt\">+12h</span>\n  </div>\n\n  <div class=\"mypredictions predictions_fade\">\n    <img class=\"predictions_img\" src=\"/sharedFiles/map_pred_2.jpg\" alt=\"\">\n    <span class=\"predictions_txt\">+24h</span>\n  </div>\n\n  <div class=\"mypredictions predictions_fade\">\n    <img class=\"predictions_img\" src=\"/sharedFiles/map_pred_3.jpg\" alt=\"\">\n    <span class=\"predictions_txt\">+36h</span>\n  </div>\n\n</div>\n\n<script>\nvar prediction_slideIndex = 0;\nprediction_showSlides();\n\nfunction prediction_showSlides() {\n\n  var prediction_i;\n  var prediction_slides = document.getElementsByClassName(\"mypredictions\");\n\n  for (prediction_i = 0; prediction_i < prediction_slides.length; prediction_i++) {\n    prediction_slides[prediction_i].style.display = \"none\";  \n  }\n\n  if (prediction_slideIndex >= prediction_slides.length) {\n    prediction_slideIndex = 0\n  }    \n\n  prediction_slides[prediction_slideIndex].style.display = \"block\";\n\n  if (prediction_slideIndex == 0) {\n    prediction_slideIndex++;\n    setTimeout(prediction_showSlides, 2000);\n  }else{\n    prediction_slideIndex++;\n    setTimeout(prediction_showSlides, 2000);\n  }\n}\n\n</script>",
        "gridPos": {
          "h": 7,
          "w": 7,
          "x": 7,
          "y": 0
        },
        "id": 2,
        "links": [],
        "mode": "html",
        "title": "",
        "transparent": true,
        "type": "text"
      },
EOL
}

function setupDashAemetForecastPrediction() {

cat >>$BASE_PATH/temp.json <<EOL
      {
        "content": "<iframe id=\"forecast_embed\" frameborder=\"0\" src=\"//forecast.io/embed/#lat=40.3232129&lon=-3.8676291&name=M&oacute;stoles&color=#2222ff&text-color=#cccccc&font=Georgia&units=ca\" style=\"margin: 1% 0 0 0; padding: 0; border: none; width:100%; height:100%;\"></iframe>",
        "gridPos": {
          "h": 7,
          "w": 10,
          "x": 14,
          "y": 0
        },
        "id": 3,
        "links": [],
        "mode": "html",
        "title": "",
        "transparent": true,
        "type": "text"
      },
EOL
}

function setupDashMeasures() {

PANEL_ID=3
for i in "${MEASURES[@]}"; do
  ((PANEL_ID++))
  PANEL_TITLE="$(echo $i | cut -d';' -f1)"
  MEASURE_NAME="$(echo $i | cut -d';' -f2)"
  MEASURE_DECIMALS="$(echo $i | cut -d';' -f3)"
  MEASURE_TYPE="$(echo $i | cut -d';' -f4)"
  MEASURE_UNIT="$(echo $i | cut -d';' -f5)"
  MEASURE_UNIT_MIN="$(echo $i | cut -d';' -f6)"
  MEASURE_UNIT_MAX="$(echo $i | cut -d';' -f7)"
  MEASURE_COLOR="$(echo $i | cut -d';' -f8)"
  MEASURE_SELECTOR="$(echo $i | cut -d';' -f9)"
  MEASURE_TH_OP_FILL_COLOR="$(echo $i | cut -d';' -f10)"
  MEASURE_TH_OP_LINE_COLOR="$(echo $i | cut -d';' -f11)"
  MEASURE_TH_OP="$(echo $i | cut -d';' -f12)"
  MEASURE_TH_VALUE="$(echo $i | cut -d';' -f13)"

  echo "@@@  Create panel $PANEL_TITLE---"
  echo Name $MEASURE_NAME
  echo Decimals $MEASURE_DECIMALS
  echo Type $MEASURE_TYPE
  echo Units $MEASURE_UNIT
  echo Color $MEASURE_COLOR
  echo Selector $MEASURE_SELECTOR
  echo Threshold line color $MEASURE_TH_OP_FILL_COLOR
  echo Threshold fill color $MEASURE_TH_OP_LINE_COLOR
  echo Threshold operation $MEASURE_TH_OP
  echo Threshold value $MEASURE_TH_VALUE

  if [[ $(( $PANEL_ID % 2 )) == 0 ]]; then
    X_POSITION=('0')
  else
    X_POSITION=('12')
  fi
cat >>$BASE_PATH/temp.json <<EOL
      {
        "aliasColors": {},
        "bars": false,
        "dashLength": 10,
        "dashes": false,
        "datasource": "{{ influx.db.name }}",
        "fill": 1,
        "gridPos": {
          "h": 7,
          "w": 12,
          "x": $X_POSITION,
          "y": 7
        },
        "id": $PANEL_ID,
        "legend": {
          "avg": false,
          "current": false,
          "max": false,
          "min": false,
          "show": false,
          "total": false,
          "values": false
        },
        "lines": true,
        "linewidth": 1,
        "links": [],
        "nullPointMode": "null",
        "percentage": false,
        "pointradius": 1,
        "points": true,
        "renderer": "flot",
        "seriesOverrides": [
          {
            "alias": "$MEASURE_NAME",
            "color": "$MEASURE_COLOR"
          }
        ],
        "spaceLength": 10,
        "stack": false,
        "steppedLine": false,
        "targets": [
          {
            "alias": "$MEASURE_NAME",
            "groupBy": [
              {
                "params": [
                  "$INTERVAL"
                ],
                "type": "time"
              },
              {
                "params": [
                  "none"
                ],
                "type": "fill"
              }
            ],
            "measurement": "$SENSOR_NAME",
            "orderByTime": "ASC",
            "policy": "default",
            "refId": "A",
            "resultFormat": "time_series",
            "select": [
              [
                {
                  "params": [
                    "value"
                  ],
                  "type": "field"
                },
                {
                  "params": [],
                  "type": "last"
                }
              ]
            ],
            "tags": [
              {
                "key": "host",
                "operator": "=",
                "value": "{{ pi.hostname }}"
              },
              {
                "condition": "AND",
                "key": "name",
                "operator": "=",
                "value": "$MEASURE_NAME"
              }
            ]
          }
        ],
        "thresholds": [
          {
            "colorMode": "custom",
            "fill": true,
            "fillColor": "#65c5db33",
            "line": false,
            "lineColor": "#ffffffff",
            "op": "lt",
            "value": -7,
            "yaxis": "left"
          },
          {
            "colorMode": "custom",
            "fill": true,
            "fillColor": "#70dbed11",
            "line": false,
            "op": "lt",
            "value": 12,
            "yaxis": "left"
          },
          {
            "colorMode": "custom",
            "fill": true,
            "fillColor": "#ef843c11",
            "line": false,
            "op": "gt",
            "value": 12,
            "yaxis": "left"
          },
          {
            "colorMode": "custom",
            "fill": true,
            "fillColor": "#bf1b0011",
            "line": false,
            "op": "gt",
            "value": 21,
            "yaxis": "left"
          },
          {
            "colorMode": "custom",
            "fill": true,
            "fillColor": "#bf1b0011",
            "line": false,
            "op": "gt",
            "value": 28,
            "yaxis": "left"
          },
          {
            "colorMode": "custom",
            "fill": true,
            "fillColor": "#bf1b0033",
            "line": false,
            "op": "gt",
            "value": 34,
            "yaxis": "left"
          }
        ],
        "timeFrom": null,
        "timeShift": null,
        "title": "$PANEL_TITLE",
        "transparent": true,
        "tooltip": {
          "shared": true,
          "sort": 0,
          "value_type": "individual"
        },
        "type": "graph",
        "xaxis": {
          "buckets": null,
          "mode": "time",
          "name": null,
          "show": true,
          "values": []
        },
        "yaxes": [
          {
            "decimals": $MEASURE_DECIMALS,
            "format": "$MEASURE_UNIT",
            "label": null,
            "logBase": 1,
            "max": "$MEASURE_UNIT_MAX",
            "min": "$MEASURE_UNIT_MIN",
            "show": true
          },
          {
            "format": "$MEASURE_TYPE",
            "label": null,
            "logBase": 1,
            "max": "$MEASURE_UNIT_MAX",
            "min": "$MEASURE_UNIT_MIN",
            "show": false
          }
        ],
        "yaxis": {
          "align": false,
          "alignLevel": null
        }
      },
EOL
done
}

function setupDashMeasuresTimeline() {

PANEL_ID=5
$Y_POSITION=7
for j in "${MEASURES_TIMELINE[@]}"; do
  ((Y_POSITION+=8))
  MEASURE_NAME_TIMELINE=$j
    echo 
    echo "-------$MEASURE_NAME_TIMELINE"
  for i in "${MEASURES[@]}"; do
    ((PANEL_ID++))
    PANEL_TITLE="$(echo $i | cut -d';' -f1)"
    MEASURE_NAME="$(echo $i | cut -d';' -f2)"
    MEASURE_DECIMALS="$(echo $i | cut -d';' -f3)"
    MEASURE_TYPE="$(echo $i | cut -d';' -f4)"
    MEASURE_UNIT="$(echo $i | cut -d';' -f5)"
    MEASURE_UNIT_MIN="$(echo $i | cut -d';' -f6)"
    MEASURE_UNIT_MAX="$(echo $i | cut -d';' -f7)"
    MEASURE_COLOR="$(echo $i | cut -d';' -f8)"
    MEASURE_SELECTOR="$(echo $i | cut -d';' -f9)"
    MEASURE_TH_OP_FILL_COLOR="$(echo $i | cut -d';' -f10)"
    MEASURE_TH_OP_LINE_COLOR="$(echo $i | cut -d';' -f11)"
    MEASURE_TH_OP="$(echo $i | cut -d';' -f12)"
    MEASURE_TH_VALUE="$(echo $i | cut -d';' -f13)"
    echo 
    echo 
    echo 
    echo "@@@  Create panel $PANEL_ID $PANEL_TITLE $MEASURE_NAME_TIMELINE at $X_POSITIONx$Y_POSITION -----"
    echo Name $MEASURE_NAME
    echo Decimals $MEASURE_DECIMALS
    echo Type $MEASURE_TYPE
    echo Units $MEASURE_UNIT
    echo Min $MEASURE_UNIT_MIN
    echo Max $MEASURE_UNIT_MAX
    echo Color $MEASURE_COLOR
    echo Selector $MEASURE_SELECTOR
    echo Threshold line color $MEASURE_TH_OP_FILL_COLOR
    echo Threshold fill color $MEASURE_TH_OP_LINE_COLOR
    echo Threshold operation $MEASURE_TH_OP
    echo Threshold value $MEASURE_TH_VALUE

    if [[ $(( $PANEL_ID % 2 )) == 0 ]]; then
      X_POSITION=('0')
    else
      X_POSITION=('12')
    fi
cat >>$BASE_PATH/temp.json <<EOL
      {
        "aliasColors": {},
        "bars": false,
        "dashLength": 10,
        "dashes": false,
        "datasource": "{{ influx.db.name }}",
        "fill": 1,
        "gridPos": {
          "h": 7,
          "w": 12,
          "x": $X_POSITION,
          "y": $Y_POSITION
        },
        "id": $PANEL_ID,
        "legend": {
          "avg": false,
          "current": false,
          "max": false,
          "min": false,
          "show": false,
          "total": false,
          "values": false
        },
        "lines": true,
        "linewidth": 1,
        "links": [],
        "nullPointMode": "null",
        "percentage": false,
        "pointradius": 1,
        "points": true,
        "renderer": "flot",
        "seriesOverrides": [
          {
            "alias": "$MEASURE_NAME",
            "color": "$MEASURE_COLOR"
          }
        ],
        "spaceLength": 10,
        "stack": false,
        "steppedLine": false,
        "targets": [
          {
            "alias": "$MEASURE_NAME",
            "groupBy": [
              {
                "params": [
                  "$INTERVAL"
                ],
                "type": "time"
              },
              {
                "params": [
                  "none"
                ],
                "type": "fill"
              }
            ],
            "measurement": "$SENSOR_NAME",
            "orderByTime": "ASC",
            "policy": "default",
            "refId": "A",
            "resultFormat": "time_series",
            "select": [
              [
                {
                  "params": [
                    "value"
                  ],
                  "type": "field"
                },
                {
                  "params": [],
                  "type": "last"
                }
              ]
            ],
            "tags": [
              {
                "key": "host",
                "operator": "=",
                "value": "{{ pi.hostname }}"
              },
              {
                "condition": "AND",
                "key": "name",
                "operator": "=",
                "value": "$MEASURE_NAME"
              }
            ]
          }
        ],
        "thresholds": [
          {
            "colorMode": "custom",
            "fill": true,
            "fillColor": "$MEASURE_TH_OP_FILL_COLOR",
            "line": true,
            "lineColor": "$MEASURE_TH_OP_LINE_COLOR",
            "op": "$MEASURE_TH_OP",
            "value": $MEASURE_TH_VALUE,
            "yaxis": "left"
          }
        ],
        "timeFrom": "$MEASURE_NAME_TIMELINE",
        "timeShift": null,
        "title": "$PANEL_TITLE",
        "transparent": true,
        "tooltip": {
          "shared": true,
          "sort": 0,
          "value_type": "individual"
        },
        "type": "graph",
        "xaxis": {
          "buckets": null,
          "mode": "time",
          "name": null,
          "show": true,
          "values": []
        },
        "yaxes": [
          {
            "decimals": $MEASURE_DECIMALS,
            "format": "$MEASURE_UNIT",
            "label": null,
            "logBase": 1,
            "max": "$MEASURE_UNIT_MAX",
            "min": "$MEASURE_UNIT_MIN",
            "show": true
          },
          {
            "format": "$MEASURE_TYPE",
            "label": null,
            "logBase": 1,
            "max": "$MEASURE_UNIT_MAX",
            "min": "$MEASURE_UNIT_MIN",
            "show": false
          }
        ],
        "yaxis": {
          "align": false,
          "alignLevel": null
        }
      },
EOL
  done
done
}

function setupDashPanels() {
#Create dashboard json temp file
cat >>$BASE_PATH/temp.json <<EOL
    "panels": [
EOL
setupDashAemetMeteobars;
setupDashAemetPrediction;
setupDashAemetForecastPrediction;
setupDashMeasures;
setupDashMeasuresTimeline;

#Delete last loop "\n," and restore "\n" 
truncate -s-2 $BASE_PATH/temp.json
echo >>$BASE_PATH/temp.json

#fix nulls
sed -i 's/"max": ""/"max": null/g' $BASE_PATH/temp.json
sed -i 's/"min": ""/"min": null/g' $BASE_PATH/temp.json

cat >>$BASE_PATH/temp.json <<EOL

    ],
EOL
}

function setupDashOptions() {
#Create dashboard json temp file
cat >>$BASE_PATH/temp.json <<EOL
    "style": "dark",
    "time": {
      "from": "now-3h",
      "to": "now"
    },
    "timepicker": {
      "refresh_intervals": [
        "5s",
        "10s",
        "30s",
        "1m",
        "5m",
        "15m",
        "30m",
        "1h",
        "2h",
        "1d"
      ],
      "time_options": [
        "5m",
        "15m",
        "1h",
        "6h",
        "12h",
        "24h",
        "2d",
        "7d",
        "30d"
      ]
    }
  }
}
EOL
}


###    MAIN    #####################################
BASE_PATH="/tmp/temp"
USER="{{ grafanaAdminUsername.stdout }}"
PASS="{{ grafanaAdminPass.stdout }}"


INTERVAL='$__interval'
HOST="{{ pi.hostname }}"
SENSOR_NAME="dht22"
INFLUX_DS="{{ influx.db.name }}"

DASHBOARD_TITLE="MeteoPi"
Y_AXIS="short"

##########################################################
####    MEASURE FORMAT 
##########################################################
#  PANEL_TITLE; MEASURE_NAME;MEASURE_DECIMALS;MEASURE_TYPE;MEASURE_UNIT;MEASURE_COLOR;MEASURE_SELECTOR;MEASURE_TH_OP_FILL_COLOR;MEASURE_TH_OP_LINE_COLOR;MEASURE_TH_OP;MEASURE_TH_VALUE"

#      PANEL_TITLE="$(echo $i | cut -d';' -f1)"
#      MEASURE_NAME="$(echo $i | cut -d';' -f2)"
#      MEASURE_DECIMALS="$(echo $i | cut -d';' -f3)"
#      MEASURE_TYPE="$(echo $i | cut -d';' -f4)"
#      MEASURE_UNIT="$(echo $i | cut -d';' -f5)"
#      MEASURE_UNIT_MIN="$(echo $i | cut -d';' -f6)"
#      MEASURE_UNIT_MAX="$(echo $i | cut -d';' -f7)"
#      MEASURE_COLOR="$(echo $i | cut -d';' -f8)"
#      MEASURE_SELECTOR="$(echo $i | cut -d';' -f9)"
#      MEASURE_TH_OP_FILL_COLOR="$(echo $i | cut -d';' -f10)"
#      MEASURE_TH_OP_LINE_COLOR="$(echo $i | cut -d';' -f11)"
#      MEASURE_TH_OP="$(echo $i | cut -d';' -f12)"
#      MEASURE_TH_VALUE="$(echo $i | cut -d';' -f13)"

MEASURES=("Temperature;temp;2;short;celsius;;;#f10000;last;#a0000033;#a00000aa;gt;30;" "Humidity;hum;2;humidity;humidity;0;100;#00ffff;last;#0088ff33;#0088ffaa;gt;70")



#One panel of each measure at these times
MEASURES_TIMELINE=( 24h 7d 1M 1y )

setupDashHeaders;
setupDashPanels;
setupDashOptions;

#Create dashboard from json file
curl -s -X POST "http://$USER:$PASS@{{ pi.network.ip }}:3000/api/dashboards/db" \
-H "Accept: application/json" \
-H "Content-Type:application/json" \
-d @$BASE_PATH/temp.json | jq . > $BASE_PATH/dashboard-create.log

#Star dashboard
DASH_ID=$(cat $BASE_PATH/dashboard-create.log | grep "\"id\"" | awk '{print $2}' | tr -d ",")
echo "Star to $DASH_ID"
curl -s -X POST "http://$USER:$PASS@{{ pi.network.ip }}:3000/api/user/stars/dashboard/$DASH_ID"
