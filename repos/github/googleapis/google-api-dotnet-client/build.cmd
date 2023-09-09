dotnet build "%~dp0\build.proj" "/bl:%BinLogDir%\build.binlog"

xcopy "%BinlogDir%\*.binlog" "%CodexDebugDir%" /S /I /Y
