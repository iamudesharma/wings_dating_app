#!/bin/bash

echo "🔍 Profile Visit Flow Test"
echo "========================="

USER_SIX_ID="l3ZjjskYHwSfWVqDdZNJjjRob4A3"

echo ""
echo "📊 Current state before Flutter app interaction:"
echo "=================================================="

echo "1. Visited profiles count:"
INITIAL_COUNT=$(curl -s "http://localhost:3000/users/${USER_SIX_ID}/visited" | jq '.visits | length')
echo "   Current count: $INITIAL_COUNT"

echo ""
echo "2. Recent visited profiles:"
curl -s "http://localhost:3000/users/${USER_SIX_ID}/visited" | jq '.visits[0:2] | .[] | {targetUserId, visitedAt, user: (.user.username // .user.id)}'

echo ""
echo "3. Profile visitors (who visited user_six):"
VISITORS_COUNT=$(curl -s "http://localhost:3000/users/${USER_SIX_ID}/visitors" | jq '.visits | length')
echo "   Visitors count: $VISITORS_COUNT"

echo ""
echo "🎯 Testing Instructions:"
echo "========================"
echo "1. Open http://localhost:55556 in your browser"
echo "2. Navigate to the dashboard/discover page"
echo "3. Click on any user profile card"
echo "4. Check browser console for debug messages:"
echo "   - 'DEBUG: Navigating to OtherUserProfileView for user: ...'"
echo "   - 'DEBUG: OtherUserProfileView initState called for user ID: ...'"
echo "   - 'DEBUG: _recordProfileVisit called - UPDATED'"
echo "   - 'DEBUG: visitProfile called with targetUserId: ...'"
echo "5. Go to Profile → Profile Visits to see the updated list"

echo ""
echo "🔄 After testing in the app, run this script again to see if counts increased"

echo ""
echo "📋 Available test users in the app:"
curl -s "http://localhost:3000/users/discover?lng=77.209&lat=28.6139&distance=5000000&userId=${USER_SIX_ID}" | jq '.data[0:3] | .[] | {id, username}'
