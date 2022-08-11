echo "-> Running 'flutter format' to check project dart style 🥹"

RESULT=$(flutter format -n lib/)
LINE_COUNT=$(echo "$RESULT" | wc -l)

if [ $LINE_COUNT -gt 1 ]; then
    echo "----> Some files are looking weird here 🤓:"
    echo "$RESULT" | sed '$d'
    exit 1
else
    echo "----> All format is good ✅"
fi
exit 0