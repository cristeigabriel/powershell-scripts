param(
    [Parameter(Mandatory=$true)]
    [string]$FilePath
)

# Read the content of the file
$lines = Get-Content $FilePath

# Iterate over each line
$output = foreach ($line in $lines) {
    # Extract the hexadecimal number until the first space
    $hex = ($line -split ' ')[0]

    # Remove the backtick character (`) and add the "bp" and "0x" prefixes
    $formattedHex = 'bp 0x' + ($hex -replace '`','')

    $formattedHex
}

# Join the output lines with a semicolon as the delimiter
$result = $output -join ';'

# Output the final result
$result
