#!/bin/bash

USER="admin"
PASS="{{ grafanaAdminPassReaded.stdout }}"

#Setup admin user email
ID=$(curl -s -X GET http://$USER:$PASS@192.168.1.11:3000/api/users/lookup?loginOrEmail=admin | jq . | grep "\"id\"" | cut -d" " -f4 | tr -d ",")
curl -s -X PUT "http://$USER:$PASS@{{ pi.network.ip }}:3000/api/users/$ID" \
-H 'Accept: application/json' \
-H 'Content-Type:application/json' \
-d '{"login":"admin","email":"{{ gmailUserReaded.stdout }}"}'
