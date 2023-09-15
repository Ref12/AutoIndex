@echo on

dotnet workload restore

dotnet build "%SrcDir%\src\Splat.sln" /r /bl:%BinLogDir%\build.binlog /p:CustomAfterMicrosoftCommonCrossTargetingTargets="%CodexBuildConfigRoot%\Custom.Inject.targets"