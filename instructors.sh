curl -X 'GET' \
  'https://api.onepeloton.com/api/instructor?limit=60' \
  -H 'accept: application/json' | jq -r '.data[]' #| "\(.name) - \(.username) - \(.quote)"'