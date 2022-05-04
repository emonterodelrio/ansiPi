#!/bin/bash

USER="admin"
PASS="{{ grafanaAdminPassReaded.stdout }}"

#Setup admin user email
ID=$(curl -s -X GET http://$USER:$PASS@127.0.0.1:3000/api/users/lookup?loginOrEmail=admin | jq . | grep "\"id\"" | cut -d" " -f4 | tr -d ",")
curl -s -X PUT "http://$USER:$PASS@127.0.0.1:3000/api/users/$ID" \
-H 'Accept: application/json' \
-H 'Content-Type:application/json' \
-d '{"login":"admin","email":"admin@grafana.com"}'
