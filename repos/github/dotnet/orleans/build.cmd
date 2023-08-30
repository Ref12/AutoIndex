REM Call build
call "%SrcDir%\build.cmd"

REM Copy binlogs
xcopy "%SrcDir%\*.binlog" "%BinlogDir%" /S /I /Y