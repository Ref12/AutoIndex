REM Build
dotnet build /r /bl:%CodexDebugDir%\build.binlog /p:CustomAfterMicrosoftCommonTargets="%CodexExtractTargets%"
