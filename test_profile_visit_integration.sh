#!/bin/bash

echo "=== Testing Profile Visit Integration ==="
echo ""

# Test 1: Record a new profile visit
echo "1. Recording a profile visit from user_six to user_two..."
response=$(curl -s -X POST http://localhost:3000/users/user_two/view/user_six -H "Content-Type: application/json")
echo "Response: $response"
echo ""

# Test 2: Check visited profiles for user_six
echo "2. Getting visited profiles for user_six..."
visited=$(curl -s -X GET http://localhost:3000/users/user_six/visited)
echo "Visited profiles: $visited"
echo ""

# Test 3: Check visitors for user_two
echo "3. Getting visitors for user_two..."
visitors=$(curl -s -X GET http://localhost:3000/users/user_two/visitors)
echo "Visitors: $visitors"
echo ""

# Test 4: Check user tap status
echo "4. Checking tap status between user_six and user_two..."
tap_status=$(curl -s -X GET http://localhost:3000/users/user_six/tap/user_two/status)
echo "Tap status: $tap_status"
echo ""

echo "=== Integration Test Complete ==="
