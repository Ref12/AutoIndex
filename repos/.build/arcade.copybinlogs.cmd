REM Copy binlogs
powershell -NoLogo -NoProfile -ExecutionPolicy Bypass -Command "%CodexBuildConfigRoot%/copybinlogs.ps1 -Source %SrcDir%\artifacts\log -Target %BinlogDir%"

REM Copy binlogs to debug dir
powershell -NoLogo -NoProfile -ExecutionPolicy Bypass -Command "%CodexBuildConfigRoot%/copybinlogs.ps1 -Source %SrcDir%\artifacts\log -Target %CodexDebugDir%"