#!/bin/bash
USER={{ grafanaAdminUsername.stdout }}
PASS={{ grafanaAdminPass.stdout }}

curl -s -X GET http://$USER:$PASS@{{ pi.network.ip }}:3000/api/search | jq .

curl -s -X POST "http://$USER:$PASS@{{ pi.network.ip }}:3000/api/dashboards/db" \
-H "Accept: application/json" \
-H "Content-Type:application/json" \
--data @<(cat <<EOF
{
  "dashboard": {
    "id": "TestApi",
    "uid": "TestApi",
    "title": "TestApi",
    "tags": [],
    "timezone": "browser",
    "schemaVersion": 16,
    "version": 1,
    "__inputs": [
      {
        "name": "{{ influx.db.name }}",
        "label": "{{ influx.db.name }}",
        "description": "",
        "type": "datasource",
        "pluginId": "influxdb",
        "pluginName": "InfluxDB"
      }
    ],
    "__requires": [
      {
        "type": "grafana",
        "id": "grafana",
        "name": "Grafana",
        "version": "5.3.2"
      },
      {
        "type": "panel",
        "id": "graph",
        "name": "Graph",
        "version": "5.0.0"
      },
      {
        "type": "datasource",
        "id": "influxdb",
        "name": "InfluxDB",
        "version": "5.0.0"
      }
    ],
    "annotations": {
      "list": [
        {
          "builtIn": 1,
          "datasource": "-- Grafana --",
          "enable": true,
          "hide": true,
          "iconColor": "rgba(0, 211, 255, 1)",
          "name": "Annotations & Alerts",
          "type": "dashboard"
        }
      ]
    },
    "editable": true,
    "gnetId": null,
    "graphTooltip": 0,
    "id": null,
    "links": [],
    "panels": [
      {
        "aliasColors": {},
        "bars": false,
        "dashLength": 10,
        "dashes": false,
        "datasource": "${DS_{{ influx.db.name }}}",
        "fill": 1,
        "gridPos": {
          "h": 9,
          "w": 12,
          "x": 0,
          "y": 0
        },
        "id": 2,
        "legend": {
          "alignAsTable": true,
          "avg": false,
          "current": false,
          "max": false,
          "min": false,
          "rightSide": true,
          "show": true,
          "total": false,
          "values": false
        },
        "lines": true,
        "linewidth": 1,
        "links": [],
        "nullPointMode": "null",
        "percentage": false,
        "pointradius": 5,
        "points": false,
        "renderer": "flot",
        "seriesOverrides": [
          {
            "alias": "Medida_1",
            "color": "rgb(255, 0, 0)"
          },
          {
            "alias": "Medida_2",
            "color": "#123456"
          }
        ],
        "spaceLength": 10,
        "stack": false,
        "steppedLine": false,
        "targets": [
          {
            "alias": "Medida_1",
            "groupBy": [
              {
                "params": [
                  "$__interval"
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
            "measurement": "dht22",
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
                "value": "temp"
              }
            ]
          },
          {
            "alias": "Medida_2",
            "groupBy": [
              {
                "params": [
                  "$__interval"
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
            "measurement": "dht22",
            "orderByTime": "ASC",
            "policy": "default",
            "refId": "B",
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
                "value": "hum"
              }
            ]
          }
        ],
        "thresholds": [],
        "timeFrom": null,
        "timeShift": null,
        "title": "Panel Title_1",
        "tooltip": {
          "shared": true,
          "sort": 0,
          "value_type": "individual"
        },
        "transparent": true,
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
            "decimals": 5,
            "format": "short",
            "label": "",
            "logBase": 1,
            "max": "222",
            "min": "111",
            "show": true
          },
          {
            "decimals": 6,
            "format": "humidity",
            "label": "",
            "logBase": 1,
            "max": "444",
            "min": "333",
            "show": true
          }
        ],
        "yaxis": {
          "align": false,
          "alignLevel": null
        }
      }
    ],
    "schemaVersion": 16,
    "style": "dark",
    "tags": [],
    "templating": {
      "list": []
    },
    "time": {
      "from": "now-6h",
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
    },
    "timezone": "browser",
    "title": "TestApi",
    "uid": "TestApi",
    "version": 4
  },
  "folderId": 0,
  "overwrite": true
}
EOF
)

curl -s -X GET http://{{ grafanaAdminUsername.stdout }}:{{ grafanaAdminPass.stdout }}@{{ pi.network.ip }}:3000/api/search | jq .
