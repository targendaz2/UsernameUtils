function New-Username(
    [Parameter(Mandatory)]
    [string]$FirstName,
    [Parameter(Mandatory)]
    [string]$LastName,
    [string]$Format,
    [string[]]$DuplicateMethod,
    [string[]]$Limitations,
    [int]$DuplicateCount = 0
) {
    $Part1 = $FirstName.Substring(0, [Math]::Min($FirstName.Length, 1))
    $Part2 = $LastName

    "$($Part1)$($Part2)".ToLower()
}
