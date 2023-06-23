REM Restore
dotnet restore build.proj

REM Build
dotnet build build.proj /bl:%CodexDebugDir%\build.binlog /p:CustomAfterMicrosoftCommonCrossTargetingTargets="%~dp0\Custom.Inject.targets" /p:CustomAfterMicrosoftCommonTargets="%CodexExtractTargets%"
