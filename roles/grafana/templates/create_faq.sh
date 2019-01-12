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


function setupDashFaq() {
cat >>$BASE_PATH/temp.json <<EOL
      {
        "content": "# Welcome to faqs\n\n\n\n## Firts to do\n\nChange home dasboard, logged as admin user, [here](http://meteopi.duckdns.org/org).",
        "gridPos": {
          "h": 15,
          "w": 24,
          "x": 0,
          "y": 0
        },
        "id": 1,
        "links": [],
        "mode": "markdown",
        "title": "",
        "transparent": true,
        "type": "text"
      }
EOL
}

function setupDashPanels() {
#Create dashboard json temp file
cat >>$BASE_PATH/temp.json <<EOL
    "panels": [
EOL
setupDashFaq;

cat >>$BASE_PATH/temp.json <<EOL

    ],
EOL
}

function setupDashOptions() {
#Create dashboard json temp file
cat >>$BASE_PATH/temp.json <<EOL
  "schemaVersion": 16,
  "style": "dark",
  "tags": [],
  "templating": {
    "list": []
  },
  "time": {
    "from": "now-3h",
    "to": "now"
  },
  "timepicker": {
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
BASE_PATH="/tmp/grafana_temp"
USER="{{ grafanaAdminUserReaded.stdout }}"
PASS="{{ grafanaAdminPassReaded.stdout }}"

DASHBOARD_TITLE="FAQ"

setupDashHeaders;
setupDashPanels;
setupDashOptions;

#Create notifications group from json file
curl -X POST "http://$USER:$PASS@{{ pi.network.ip }}:3000/api/alert-notifications" \
-H 'Accept: application/json' \
-H 'Content-Type:application/json' \
-d '{"name":"Notifications channel","type":"email","isDefault":true,"sendReminder":false,"settings":{"addresses": "{{ gmailUserReaded.stdout }}"}}' | jq . > $BASE_PATH/notificationsChanel-create.log

#Create dashboard from json file
curl -X POST "http://$USER:$PASS@{{ pi.network.ip }}:3000/api/dashboards/db" \
-H "Accept: application/json" \
-H "Content-Type:application/json" \
-d @$BASE_PATH/temp.json | jq . > $BASE_PATH/dashboard-create.log


ID=$(cat $BASE_PATH/dashboard-create.log  | grep "\"id\"" | awk '{print $2}' | tr -d ",")

cat >>$BASE_PATH/dashHomeSetup.json <<EOL
{"homeDashboardId": $ID}
EOL

curl -X PUT "http://$USER:$PASS@{{ pi.network.ip }}:3000/api/user/preferences" \
-H 'Accept: application/json'  \
-H 'Content-Type:application/json' \
-d @$BASE_PATH/dashHomeSetup.json | jq . > $BASE_PATH/setupHomeDashboard.log

