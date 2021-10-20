Remove-Item polaroids.html
New-Item polaroids.html -Itemtype file | Out-Null
Add-Content polaroids.html '
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
@IMPORT <link href="https://fonts.googleapis.com/css?family=Poor+Story" rel="stylesheet">

* {
  box-sizing: border-box;
}

body {
  font-family: "Poor Story", cursive;
  background: #bdffbd;
}

.wrapper {
  width: 100%;
  padding: 0 2rem;
  text-align: center;
}
.polaroid {
  background: #fff;
  padding: 1rem;
  box-shadow: 0 0.2rem 1.2rem rgba(0,0,0,0.2);
  
}
.polaroid > img{
  max-width: 100%;
  height: auto;
}
.caption {
  font-size: 1.8rem;
  text-align: center;
  line-height: 2em;
}
.item {
  width: 30%;
  display: inline-block;
  margin-top: 2rem;
  filter: grayscale(100%);
}
.item .polaroid:before {
  content: '';
  position: absolute;
  z-index: -1;
  transition: all 0.35s;
}
.item:nth-of-type(4n+1) {
  transform: scale(0.8, 0.8) rotate(5deg);
  transition: all 0.35s;
}
.item:nth-of-type(4n+1) .polaroid:before {
  transform: rotate(6deg);
  height: 20%;
  width: 47%;
  bottom: 30px;
  right: 12px;
  box-shadow: 0 2.1rem 2rem rgba(0,0,0,0.4);
}
.item:nth-of-type(4n+2) {
  transform: scale(0.8, 0.8) rotate(-5deg);
  transition: all 0.35s;
}
.item:nth-of-type(4n+2) .polaroid:before {
  transform: rotate(-6deg);
  height: 20%;
  width: 47%;
  bottom: 30px;
  left: 12px;
  box-shadow: 0 2.1rem 2rem rgba(0,0,0,0.4);
}
.item:nth-of-type(4n+4) {
  transform: scale(0.8, 0.8) rotate(3deg);
  transition: all 0.35s;
}
.item:nth-of-type(4n+4) .polaroid:before {
  transform: rotate(4deg);
  height: 20%;
  width: 47%;
  bottom: 30px;
  right: 12px;
  box-shadow: 0 2.1rem 2rem rgba(0,0,0,0.3);
}
.item:nth-of-type(4n+3) {
  transform: scale(0.8, 0.8) rotate(-3deg);
  transition: all 0.35s;
}
.item:nth-of-type(4n+3) .polaroid:before {
  transform: rotate(-4deg);
  height: 20%;
  width: 47%;
  bottom: 30px;
  left: 12px;
  box-shadow: 0 2.1rem 2rem rgba(0,0,0,0.3);
}
.item:hover {
  filter: none;
  transform: scale(1, 1) rotate(0deg) !important;
  transition: all 0.35s;
}
.item:hover .polaroid:before {
  content: '';
  position: absolute;
  z-index: -1;
  transform: rotate(0deg);
  height: 90%;
  width: 90%;
  bottom: 0%;
  right: 5%;
  box-shadow: 0 1rem 3rem rgba(0,0,0,0.2);
  transition: all 0.35s;
}
</style>
</head>
<body>

<div class="w3-container w3-teal">
<h1>Peloton Instructors</h1>
</div>
<div class="wrapper">'

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
    Add-Content polaroids.html '
    <div class="item">
    <div class="polaroid"><img src='
        Add-Content polaroids.html $_.data[$i].image_url
        Add-Content polaroids.html '
        >
      <div class="caption">'
            Add-Content polaroids.html $_.data[$i].name
            Add-Content polaroids.html '</div>
            </div>
          </div>'
  $i++
  }
}

Add-Content polaroids.html '
</div>
</body>
</html>'