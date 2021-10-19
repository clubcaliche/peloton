Remove-Item photos.html
New-Item photos.html -Itemtype file | Out-Null
Add-Content photos.html '
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
</div>'

#$json = curl.exe -X 'GET' `
#  'https://api.onepeloton.com/api/instructor?limit=50' `
#  -H 'accept: application/json'

#$data = ConvertFrom-Json $json

$rest = Invoke-RestMethod -Method Get -Uri https://api.onepeloton.com/api/instructor?limit=50

$rest | ForEach-Object $_ {
  $count = $rest.count
  $i = 0
  #loop through the array ... 0 to Count-1
  while ($i -lt $count) {
    Add-Content photos.html '
    <div class=w3-card-4>
    </div>
    <div class=w3-third>
      <div class=w3-card>
        <img src='
        Add-Content photos.html $_.data[$i].image_url
        Add-Content photos.html '
        style=width:100%>
          <div class=w3-container>
            <h4>'
            Add-Content photos.html $_.data[$i].name
            Add-Content photos.html '</h4>
          </div>
      </div>
    </div>'
  $i++
  }
}

Add-Content photos.html '
</body>
</html>'