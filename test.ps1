. .\GetInstructors.ps1

$rest = Get-Instructors1

$rest.count

$i = 0

while ($i -lt $rest.count) {
    echo "money"
    $rest[$i].name
    $i++
} 