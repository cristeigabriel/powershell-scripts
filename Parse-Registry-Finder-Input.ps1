# Get the input and output file paths from the command-line arguments
$inputFilePath = $args[0]
$outputFilePath = $args[1]

# Read the input file
$inputFileContent = Get-Content $inputFilePath

# Loop through each line of the input file
foreach ($line in $inputFileContent) {
    # Get the text until the first multiple whitespace characters in a row
    $text = $line -split '\s{2,}' | Select-Object -First 1

    # If there were no multiple whitespace characters in a row, use the entire line
    if (!$text) {
        $text = $line
    }

    # Trim any whitespace at the end of the line
    $text = $text.TrimEnd()

    # Replace long hive names with short alternatives
    $text = $text.Replace("HKEY_CLASSES_ROOT", "HKCR")
    $text = $text.Replace("HKEY_CURRENT_USER", "HKCU")
    $text = $text.Replace("HKEY_LOCAL_MACHINE", "HKLM")

    # Add @" at the start and ", at the end of the line
    $text = '@"' + $text + '",'

    # Write the modified text to the output file
    Add-Content -Path $outputFilePath -Value $text
}
