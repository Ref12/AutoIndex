REM Build
dotnet build /r /bl:%BinLogDir%\build.binlog 
REM /p:CustomAfterMicrosoftCommonTargets="%CodexExtractTargets%"
