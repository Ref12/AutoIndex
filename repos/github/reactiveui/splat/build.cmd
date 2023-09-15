@echo on

dotnet workload restore --project "%SrcDir%\src\Splat.sln"

dotnet build "%SrcDir%\src\Splat.sln" /r /bl:%BinLogDir%\build.binlog /p:CustomAfterMicrosoftCommonCrossTargetingTargets="%CodexBuildConfigRoot%\Custom.Inject.targets"