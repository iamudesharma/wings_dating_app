#!/bin/bash

echo "=== Testing Profile Visits and Tap Functionality ==="
echo ""

BASE_URL="http://localhost:3000"
USER_ONE="9D1Igdk0TeSoDo9f68XkFNACFMi1"  # user_one
USER_TWO="user2_DEF456"  # user_two
USER_THREE="user3_GHI789"  # user_three

echo "1. Testing Profile Visit Recording..."
echo "Recording visit from $USER_ONE to $USER_TWO:"
curl -s -X POST "$BASE_URL/users/$USER_TWO/view/$USER_ONE" -H "Content-Type: application/json" | jq '.'

echo ""
echo "2. Testing Tap Functionality..."
echo "User $USER_ONE tapping $USER_TWO:"
curl -s -X POST "$BASE_URL/users/$USER_ONE/tap/$USER_TWO" -H "Content-Type: application/json" | jq '.'

echo ""
echo "3. Testing Tap Status Check..."
echo "Checking if $USER_ONE has tapped $USER_TWO:"
curl -s -X GET "$BASE_URL/users/$USER_ONE/tap/$USER_TWO/status" -H "Content-Type: application/json" | jq '.'

echo ""
echo "4. Testing Visited Profiles API..."
echo "Getting profiles visited by $USER_ONE:"
curl -s -X GET "$BASE_URL/users/$USER_ONE/visited" -H "Content-Type: application/json" | jq '.visits | length' 
echo "Visited profiles count: $(curl -s -X GET "$BASE_URL/users/$USER_ONE/visited" -H "Content-Type: application/json" | jq '.total')"

echo ""
echo "5. Testing Profile Visitors API..."
echo "Getting visitors to $USER_ONE's profile:"
curl -s -X GET "$BASE_URL/users/$USER_ONE/visitors" -H "Content-Type: application/json" | jq '.visits | length'
echo "Visitors count: $(curl -s -X GET "$BASE_URL/users/$USER_ONE/visitors" -H "Content-Type: application/json" | jq '.total')"

echo ""
echo "=== Test Complete ==="

# Test recording profile view with engagement status
echo ""
echo "6. Testing Profile View with Engagement Status..."
echo "Recording view from $USER_THREE to $USER_TWO (after $USER_THREE taps $USER_TWO):"

# First tap user_two
curl -s -X POST "$BASE_URL/users/$USER_THREE/tap/$USER_TWO" -H "Content-Type: application/json" > /dev/null

# Then view profile
echo "Profile view with tap status:"
curl -s -X POST "$BASE_URL/users/$USER_TWO/view/$USER_THREE" -H "Content-Type: application/json" | jq '.'
