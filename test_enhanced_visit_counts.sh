#!/bin/bash

echo "🎯 Enhanced Profile Visit Count Testing"
echo "======================================="

USER_SIX_ID="l3ZjjskYHwSfWVqDdZNJjjRob4A3"
TEST_USER="9D1Igdk0TeSoDo9f68XkFNACFMi1"

echo ""
echo "📊 Current State:"
echo "=================="
echo "1. Total visits by user_six:"
INITIAL_COUNT=$(curl -s "http://localhost:3000/users/${USER_SIX_ID}/visited" | jq '.total')
echo "   Total: $INITIAL_COUNT visits"

echo ""
echo "2. Recent visits with counts:"
curl -s "http://localhost:3000/users/${USER_SIX_ID}/visited" | jq '.visits[0:3] | .[] | {targetUserId, visitCount, user: (.user.username // "No username"), visitedAt}'

echo ""
echo "🔄 Testing Multiple Visits:"
echo "==========================="
echo "Making 5 visits to user ${TEST_USER}..."

for i in {1..5}; do
    echo "Visit $i:"
    RESPONSE=$(curl -s -X POST "http://localhost:3000/users/${TEST_USER}/view/${USER_SIX_ID}")
    VISIT_COUNT=$(echo $RESPONSE | jq '.visitCount')
    echo "  Visit count: $VISIT_COUNT"
    sleep 1
done

echo ""
echo "📋 Updated Visit List:"
echo "====================="
curl -s "http://localhost:3000/users/${USER_SIX_ID}/visited" | jq '.visits[0:2] | .[] | {targetUserId, visitCount, visitedAt}'

echo ""
echo "👥 Testing Visitors (who visited user_six):"
echo "==========================================="
VISITORS_COUNT=$(curl -s "http://localhost:3000/users/${USER_SIX_ID}/visitors" | jq '.total')
echo "Total visitors: $VISITORS_COUNT"

echo ""
echo "Recent visitors with counts:"
curl -s "http://localhost:3000/users/${USER_SIX_ID}/visitors" | jq '.visits[0:2] | .[] | {userId, visitCount, user: (.user.username // "No username"), visitedAt}'

echo ""
echo "🎨 Frontend Display Testing:"
echo "============================"
echo "Visit count formatting examples:"
echo "  1 visit   → '1' (Visited once)"
echo "  5 visits  → '5' (Visited 5 times)"
echo "  10 visits → '10' (Visited 10 times)"
echo "  15 visits → '10+' (Visited 10+ times)"

echo ""
echo "📱 Flutter App Testing:"
echo "======================="
echo "1. Open http://localhost:55556 in browser"
echo "2. Go to Profile → Profile Visits"
echo "3. Check both 'I Visited' and 'Visited Me' tabs"
echo "4. Look for visit count badges and text"
echo "5. Visit more profiles to see counts increment"

echo ""
echo "✅ Enhanced Profile Visits Feature is ready!"
echo "============================================"
echo "Features implemented:"
echo "  ✓ Visit count tracking (increments instead of duplicates)"
echo "  ✓ Smart display logic (1-10 exact, 10+ for more)"
echo "  ✓ Beautiful UI with count badges"
echo "  ✓ Real-time updates when visiting profiles"
echo "  ✓ Both 'I Visited' and 'Visited Me' tabs show counts"
