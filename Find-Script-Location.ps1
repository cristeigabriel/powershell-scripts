$command = Read-Host "Enter the command name"

$commandInfo = Get-Command $command
if ($commandInfo -eq $null) {
    Write-Host "Command not found"
} else {
    $scriptPath = $commandInfo.ScriptBlock.File
    Write-Host "Script Path: $scriptPath"
}
