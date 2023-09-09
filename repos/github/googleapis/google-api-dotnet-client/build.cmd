set MSBuildEmitSolution=1

dotnet build "%~dp0\build.proj" "/bl:%BinLogDir%\build.binlog"
