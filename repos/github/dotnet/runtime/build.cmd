REM Disk space Before Build
powershell -NoLogo -NoProfile -ExecutionPolicy Bypass -Command "%CodexBuildConfigRoot%/diskspace.ps1"

REM Build using arcade build logic
powershell -NoLogo -NoProfile -ExecutionPolicy Bypass -Command "eng/build.ps1 -ci -restore -build -binaryLog

REM Disk space Post Build
powershell -NoLogo -NoProfile -ExecutionPolicy Bypass -Command "%CodexBuildConfigRoot%/diskspace.ps1"

REM Copy binlogs
xcopy "%SrcDir%\artifacts\log\*.binlog" "%BinlogDir%" /S /I /Y

REM Copy binlogs to debug dir
xcopy "%SrcDir%\artifacts\log\*.binlog" "%CodexDebugDir%" /S /I /Y