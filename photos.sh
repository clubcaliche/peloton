rm pictures.html
cat << EOF >> pictures.html
<!DOCTYPE html> 
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
p {
  color: blue;
  font-family: verdana;
  font-size: 100%;
}
</style>
</head>
<body>

<div class="w3-container w3-teal">
  <h1>Peloton Instructors</h1>
</div>
EOF

curl -s -X 'GET' \
    'https://api.onepeloton.com/api/instructor?limit=60' \
    -H 'accept: application/json' | \
    jq -r '.data[] | "\(.image_url) \(.name)"' | \
    while read IMAGE NAME

do
    cat << EOF >> pictures.html
    <div class=w3-card-4>
    </div>
    <div class=w3-third>
      <div class=w3-card>
          <img src=$IMAGE style=width:100%>
          <div class=w3-container>
              <h4>$NAME</h4>
          </div>
      </div>
    </div>
EOF
done

cat << EOF >> pictures.html
</body> 
</html>
EOF
