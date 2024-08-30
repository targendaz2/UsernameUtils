function Get-FirstNChars {
    [CmdletBinding(DefaultParameterSetName = 'WithoutPipe')]
    param(
        [Parameter(Mandatory, Position = 0, ParameterSetName = 'WithoutPipe')]
        [Parameter(Mandatory, ValueFromPipeline, ParameterSetName = 'WithPipe')]
        [string]$String,

        [Parameter(Mandatory, ParameterSetName = 'WithoutPipe')]
        [Parameter(Mandatory, Position = 0, ParameterSetName = 'WithPipe')]
        [ValidateRange('NonNegative')]
        [int]$Count
    )

    $String.Substring(0, [Math]::Min($String.Length, $Count))
}

enum UsernameFormat {
    FirstDotLast
    FirstLast
    FLast
    First
    Initials
}

enum ConflictResolution {
    IncreaseNumber
    AddLastName
}

function New-Username {
    param(
        [Parameter(Mandatory)]
        [string]$FirstName,

        [Parameter(Mandatory)]
        [string]$LastName,

        [Parameter(Mandatory)]
        [UsernameFormat]$Format,

        [ConflictResolution[]]$ConflictResolution = 'IncreaseNumber',

        [ValidateRange('NonNegative')]
        [int]$ConflictCount = 0
    )

    $Part1 = ''
    $Separator = ''
    $Part2 = ''
    $Number = ''

    switch ($Format) {
        'FirstDotLast' {
            $Part1 = $FirstName
            $Separator = '.'
            $Part2 = $LastName
        }

        'FirstLast' {
            $Part1 = $FirstName
            $Part2 = $LastName
        }

        'FLast' {
            $Part1 = $FirstName | Get-FirstNChars 1
            $Part2 = $LastName
        }

        'First' {
            $Part1 = $FirstName
            if ($ConflictCount -gt 0) {
                $Part2 = $LastName | Get-FirstNChars $ConflictCount
            }
        }

        'Initials' {
            $Part1 = $FirstName | Get-FirstNChars 1
            $Part2 = $LastName | Get-FirstNChars 1
        }
    }

    if ($ConflictCount -gt 0) {
        switch ($ConflictResolution) {
            'IncreaseNumber' {
                $Number = $ConflictCount + 1
            }
        }
    }

    "$($Part1)$($Separator)$($Part2)$($Number)".ToLower()
}
