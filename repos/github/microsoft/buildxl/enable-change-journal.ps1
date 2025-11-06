#Requires -RunAsAdministrator

$SourceDrive = Split-Path -Qualifier $Env:SrcDir

Write-Host "fsutil usn createjournal m=0x20000000 a=0x8000000 $SourceDrive"
. fsutil usn createjournal m=0x20000000 a=0x8000000 $SourceDrive