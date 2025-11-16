#!/bin/bash

BASE_URL="http://localhost:3000"
OWNER_ID="test_owner_$(date +%s)"
REQUESTER_ID="test_requester_$(date +%s)"

echo "1) Create album as owner $OWNER_ID"
RESP=$(curl -s -X POST "$BASE_URL/albums" -H "Content-Type: application/json" -d '{"ownerId":"'$OWNER_ID'","name":"Test Album","photos":[]}')
echo $RESP | jq '.'
ALBUM_ID=$(echo $RESP | jq -r '._id')

if [ "$ALBUM_ID" == "null" ] || [ -z "$ALBUM_ID" ]; then
  echo "Failed to create album"; exit 1
fi

echo "\n2) Request access for the first time (should return 201)"
RESP1=$(curl -s -X POST "$BASE_URL/albums/$ALBUM_ID/request-access" -H "Content-Type: application/json" -d '{"requesterId":"'$REQUESTER_ID'","message":"Hello"}')
echo $RESP1 | jq '.'
CODE1=$(echo $RESP1 | jq -r '.code')
if [ "$CODE1" != "201" ]; then
  echo "First request not successful, code=$CODE1"; exit 2
fi
REQUEST_ID=$(echo $RESP1 | jq -r '.data.requestId')

echo "\n3) Request access again while pending (should return 409)"
RESP2=$(curl -s -X POST "$BASE_URL/albums/$ALBUM_ID/request-access" -H "Content-Type: application/json" -d '{"requesterId":"'$REQUESTER_ID'","message":"Please"}')
echo $RESP2 | jq '.'
CODE2=$(echo $RESP2 | jq -r '.code')
if [ "$CODE2" != "409" ]; then
  echo "Second request should be 409, got $CODE2"; exit 3
fi

echo "\n4) Moderate the request to 'reject' (using admin endpoint; no auth in test env)"
RESP3=$(curl -s -X POST "$BASE_URL/api/admin/album-requests/$REQUEST_ID/moderate" -H "Content-Type: application/json" -d '{"action":"reject","moderatorId":"system_admin"}')
echo $RESP3 | jq '.'

echo "\n5) Request again after rejection (should return 200 and re-sent)"
RESP4=$(curl -s -X POST "$BASE_URL/albums/$ALBUM_ID/request-access" -H "Content-Type: application/json" -d '{"requesterId":"'$REQUESTER_ID'","message":"Trying again"}')
echo $RESP4 | jq '.'
CODE4=$(echo $RESP4 | jq -r '.code')
if [ "$CODE4" != "200" ]; then
  echo "Expected 200 on re-request, got $CODE4"; exit 4
fi

echo "\nAll tests passed for album request access."