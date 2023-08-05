REM Build using arcade build logic
powershell -NoLogo -NoProfile -ExecutionPolicy Bypass -Command "eng/common/build.ps1 -restore -build -binarylog -nodeReuse:$false"

REM Copy binlogs
xcopy "%SrcDir%\*.binlog" "%BinlogDir%" /S /I /Y