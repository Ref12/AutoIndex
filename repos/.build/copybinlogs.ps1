param(
    [Parameter(Mandatory=$true)] 
    [string] $Source,

    [Parameter(Mandatory=$true)] 
    [string] $Target
)

# Create destination directory if it doesn't exist
if (-not (Test-Path -Path $Target)) {
    New-Item -ItemType Directory -Path $Target
}

# Copy all .binlog files from source to destination
Get-ChildItem -Path $Source -Filter *.binlog -Recurse | ForEach-Object {
    Write-Host "Copying binlog $($_.FullName) to $($Target)"
    Copy-Item -Path $_.FullName -Destination $Target -Force
}

Write-Output "Copying binlogs complete."