dotnet build "%~dp0\build.proj" /t:RestoreSolutions "/bl:%CodexDebugDir%\restore.sln.binlog"

dotnet build "%~dp0\build.proj" /t:BuildSolutions "/bl:%BinlogDir%\build.sln.binlog"

dotnet build "%~dp0\build.proj" "/bl:%BinLogDir%\build.binlog"

xcopy "%BinlogDir%\*.binlog" "%CodexDebugDir%\" /S /I /Y /F
