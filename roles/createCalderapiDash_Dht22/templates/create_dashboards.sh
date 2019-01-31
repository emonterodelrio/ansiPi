#!/bin/bash

function setupDashHeaders() {
#Create dashboard json temp file
cat >$BASE_PATH/temp.json <<EOL
{
	"folderId": 0,
	"overwrite": true,
	"dashboard": {
		"uid": "{{ pi.pretty_name }}",
		"title": "{{ pi.pretty_name }}",
		"tags": [],
		"timezone": "browser",
		"version": 0,
		"editable": true,
		"gnetId": null,
		"graphTooltip": 0,
		"links": [],
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
        "datasource": "{{ DHT22.influxdb.db }}",
        "fill": 0,
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
        "points": false,
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
EOL
  if [[ $(( $PANEL_ID % 2 )) == 0 ]]; then
cat >>$BASE_PATH/temp.json <<EOL
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
EOL
  else
cat >>$BASE_PATH/temp.json <<EOL
        "thresholds": [
          {
            "colorMode": "custom",
            "fill": true,
            "fillColor": "rgba(193, 92, 23, 0.1)",
            "line": false,
            "op": "lt",
            "value": 40,
            "yaxis": "left"
          },
          {
            "colorMode": "custom",
            "fill": true,
            "fillColor": "rgba(112, 219, 237, 0.1)",
            "line": false,
            "op": "gt",
            "value": 85,
            "yaxis": "left"
          }
        ],
EOL
  fi
cat >>$BASE_PATH/temp.json <<EOL
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
        "datasource": "{{ DHT22.influxdb.db }}",
        "fill": 0,
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
        "points": false,
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
EOL
  if [[ $(( $PANEL_ID % 2 )) == 0 ]]; then
cat >>$BASE_PATH/temp.json <<EOL
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
EOL
  else
cat >>$BASE_PATH/temp.json <<EOL
        "thresholds": [
          {
            "colorMode": "custom",
            "fill": true,
            "fillColor": "rgba(193, 92, 23, 0.1)",
            "line": false,
            "op": "lt",
            "value": 40,
            "yaxis": "left"
          },
          {
            "colorMode": "custom",
            "fill": true,
            "fillColor": "rgba(112, 219, 237, 0.1)",
            "line": false,
            "op": "gt",
            "value": 85,
            "yaxis": "left"
          }
        ],
EOL
  fi
cat >>$BASE_PATH/temp.json <<EOL
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
		"refresh": "30s",
		"schemaVersion": 16,
		"style": "dark",
		"templating": {
			"list": []
		},
		"time": {
			"from": "now-3h",
			"to": "now"
		},
		"timepicker": {
			"refresh_intervals": [
				"30s"
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
BASE_PATH="/tmp/dht22_dash_temp"
USER="{{ grafanaAdminUserReaded.stdout }}"
PASS="{{ grafanaAdminPassReaded.stdout }}"


INTERVAL='$__interval'
SENSOR_NAME="dht22_heating"
INFLUX_DS="{{ DHT22.influxdb.db }}"

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

MEASURES=("Temperature;temp;2;short;celsius;;;#00ff24;last;#a0000033;#a00000aa;gt;30;" "Humidity;hum;2;humidity;humidity;0;100;#00ffff;last;#0088ff33;#0088ffaa;gt;70")



#One panel of each measure at these times
MEASURES_TIMELINE=( 24h 1w 1M 3M )

setupDashHeaders;
setupDashPanels;
setupDashOptions;

echo $USER
echo $PASS
echo "curl -s -X POST 'http://$USER:$PASS@{{ grafana.ip }}:3000/api/dashboards/db' \
-H 'Accept: application/json' \
-H 'Content-Type:application/json' \
-d @$BASE_PATH/temp.json | jq ."

#Create dashboard from json file
curl -s -X POST "http://$USER:$PASS@{{ grafana.ip }}:3000/api/dashboards/db" \
-H "Accept: application/json" \
-H "Content-Type:application/json" \
-d @$BASE_PATH/temp.json | jq . > $BASE_PATH/dashboard-create.log

#Star dashboard
DASH_ID=$(cat $BASE_PATH/dashboard-create.log | grep "\"id\"" | awk '{print $2}' | tr -d ",")
echo "Star to $DASH_ID"
curl -s -X POST "http://$USER:$PASS@{{ grafana.ip }}:3000/api/user/stars/dashboard/$DASH_ID"
