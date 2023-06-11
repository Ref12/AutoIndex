#Taken from https://github.com/dotnet/maui/blob/main/.github/DEVELOPMENT.md

REM install local tools required to build (cake, pwsh, etc..)
dotnet tool restore

REM Provision .NET SDK in bin\dotnet
dotnet build src\DotNet\DotNet.csproj

REM Builds Maui MSBuild tasks
.\bin\dotnet\dotnet build Microsoft.Maui.BuildTasks.slnf /bl:%BinLogDir%\Microsoft.Maui.BuildTasks.binlog

REM Builds the rest of Maui
.\bin\dotnet\dotnet build Microsoft.Maui.sln /bl:%BinLogDir%\Microsoft.Maui.binlog