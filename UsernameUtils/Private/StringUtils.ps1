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
