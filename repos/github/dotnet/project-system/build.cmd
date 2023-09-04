set MSBuildPath=dotnet build

REM Build using arcade build logic
call "%SrcDir%\build.cmd" /p:Test=false

REM Copy binlogs
xcopy "%SrcDir%\*.binlog" "%BinlogDir%" /S /I /Y