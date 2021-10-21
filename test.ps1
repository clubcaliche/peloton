. .\GetInstructors.ps1

$rest = Get-Instructors1

$i = 0

while ($i -lt $rest.count) {
    $rest[$i].name
    $i++
} 