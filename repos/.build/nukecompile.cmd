REM Add Directory.build.rsp which specifies that binlog should be produced
move "%~dp0\Binlog.Directory.build.rsp" "%SrcDir%\..\Directory.build.rsp"
REM Check if the first argument is set
if "%~1"=="" (
    REM If not set, call build.cmd with no arguments
    call "%SrcDir%\build.cmd" Compile
) else (
    REM If set, call build.cmd with the first argument
    call "%SrcDir%\build.cmd" %1
)

REM Copy binlogs
xcopy "%SrcDir%\*.binlog" "%BinlogDir%" /S /I /Y