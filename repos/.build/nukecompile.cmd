REM Add Directory.build.rsp which specifies that binlog should be produced
move "%~dp0\Binlog.Directory.build.rsp" "%SrcDir%\..\Directory.build.rsp"

REM Call build
call "%SrcDir%\build.cmd" Compile

REM Copy binlogs
xcopy "%SrcDir%\*.binlog" "%BinlogDir%" /S /I /Y