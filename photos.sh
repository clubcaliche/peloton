echo "<!DOCTYPE html>" >> pictures.html
echo "<html>" >> pictures.html
echo "<head>" >> pictures.html
echo '<meta name="viewport" content="width=device-width, initial-scale=1">' >> pictures.html
echo '<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">' >> pictures.html
echo "<style>" >> pictures.html
echo "p {" >> pictures.html
echo "  color: blue;" >> pictures.html
echo "  font-family: verdana;" >> pictures.html
echo "  font-size: 100%;" >> pictures.html
echo "}" >> pictures.html
echo "</style>" >> pictures.html
echo "</head>" >> pictures.html
echo "<body>" >> pictures.html

echo '<div class="w3-container w3-teal">' >> pictures.html
echo '  <h1>Peloton Instructors</h1>' >> pictures.html
echo '</div>' >> pictures.html

curl -X 'GET' \
    'https://api.onepeloton.com/api/instructor?limit=60' \
    -H 'accept: application/json' | \
    jq -r '.data[] | "\(.image_url) \(.name)"' | \
    while read IMAGE NAME

do
    echo "<div class=w3-card-4>" >> pictures.html
    echo "</div>" >> pictures.html
    echo "<div class=w3-third>" >> pictures.html
    echo "  <div class=w3-card>" >> pictures.html
    echo "      <img src=$IMAGE style=width:100%>" >> pictures.html
    echo "      <div class=w3-container>" >> pictures.html
    echo "          <h4>$NAME</h4>" >> pictures.html
    echo "      </div>" >> pictures.html
    echo "  </div>" >> pictures.html
    echo "</div>" >> pictures.html
done

echo "</body>" >> pictures.html
echo "</html>" >> pictures.html