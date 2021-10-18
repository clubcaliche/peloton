function Get-Instructors1() {

    <#
    .SYNOPSIS
    Retrieve a list of Peloton instructors using the Peloton public REST API

    .DESCRIPTION
    Retrieve a list of Peloton instructors using the Peloton public REST API. Uses Invoke-RestMethod cmdlet

    .PARAMETER Page
    Indicate a specific page in the REST request. Default is 0

    .PARAMETER Credentials
    Indicate a specific limit in the REST request. Default is 20

    .INPUTS
    None. You cannot pipe objects to Get-Instructors1

    .OUTPUTS
    list. The Get-Instructors1 function returns a list of all Peloton instructors
    #>

    param (
        [int]$Page = 0,
        [int]$Limit = 25
    )

    $instructors_uri = "https://api.onepeloton.com/api/instructor?page=$Page&limit=$Limit"

    Write-Debug("REST API GET to $($instructors_uri)")
    $response = Invoke-RestMethod -Method "GET" -Uri $instructors_uri
    Write-Debug("> Found response page $($response.page + 1) of $($response.page_count)")
    Write-Debug("> Found $(($response.data).Length) instructors in the response page")

    if ($response.show_next) {
        Write-Debug("> Additional data available. Sending additional request")
        return $response.data + (Get-Instructors1 -Limit $Limit -Page ($Page + 1))
    } else {
        Write-Debug("> No additional data")
        return $response.data
    }
}

function Get-Instructors2() {

    <#
    .SYNOPSIS
    Retrieve a list of Peloton instructors using the Peloton public REST API

    .DESCRIPTION
    Retrieve a list of Peloton instructors using the Peloton public REST API. Uses Invoke-WebRequest cmdlet

    .PARAMETER Page
    Indicate a specific page in the REST request. Default is 0

    .PARAMETER Credentials
    Indicate a specific limit in the REST request. Default is 20

    .INPUTS
    None. You cannot pipe objects to Get-Instructors2

    .OUTPUTS
    list. The Get-Instructors2 function returns a list of all Peloton instructors
    #>

    param (
        [int]$Page = 0,
        [int]$Limit = 25
    )

    $instructors_uri = "https://api.onepeloton.com/api/instructor?page=$Page&limit=$Limit"

    Write-Debug("REST API GET to $($instructors_uri)")
    $response = Invoke-WebRequest -Method "GET" -Uri $instructors_uri
    Write-Debug("RESPONSE: $($response.StatusCode)/$($response.StatusDescription)")
    $response_content = ConvertFrom-Json $([String]::new($response.Content))
    Write-Debug("> Found response page $($response_content.page + 1) of $($response_content.page_count)")
    Write-Debug("> Found $(($response_content.data).Length) instructors in the response page")

    if ($response_content.show_next) {
        Write-Debug("> Additional data available. Sending additional request")
        return $response_content.data + (Get-Instructors2 -Limit $Limit -Page ($Page + 1))
    } else {
        Write-Debug("> No additional data")
        return $response_content.data
    }
}

##### Test the functions #####

Write-Host "Test using Invoke-RestMethod"
$instructors1 = Get-Instructors1
Write-Host("Found $($instructors1.Count) instructors")

Write-Host

Write-Host "Test using Invoke-WebRequest"
$instructors2 = Get-Instructors2
Write-Host("Found $($instructors2.Count) instructors")