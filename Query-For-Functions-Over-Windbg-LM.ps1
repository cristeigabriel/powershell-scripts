param (
    [Parameter(Mandatory=$true)]
    [string]$inputString,
    
    [Parameter(Mandatory=$true)]
    [string]$inputFile
)

$lines = Get-Content $inputFile

foreach ($line in $lines) {
    $startIndex = $line.IndexOf('   ')  # Find the first occurrence of three spaces

    if ($startIndex -ne -1) {
        $endIndex = $line.IndexOf(' ', $startIndex + 3)  # Find the first space after three spaces

        if ($endIndex -ne -1) {
            $result = $line.Substring($startIndex + 3, $endIndex - $startIndex - 3)
            $newLine = "x $result!$inputString;"
            Write-Host -NoNewline $newLine
        }
    }
}
