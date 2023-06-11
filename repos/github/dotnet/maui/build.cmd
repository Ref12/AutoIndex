#Taken from https://github.com/dotnet/maui/blob/main/.github/DEVELOPMENT.md

# install local tools required to build (cake, pwsh, etc..)
dotnet tool restore

# Provision .NET SDK in bin\dotnet
dotnet build src\DotNet\DotNet.csproj

# Builds Maui MSBuild tasks
.\bin\dotnet\dotnet build Microsoft.Maui.BuildTasks.slnf /bl:%BinLogDir%\Microsoft.Maui.BuildTasks.binlog

# Builds the rest of Maui
.\bin\dotnet\dotnet build Microsoft.Maui.sln /bl:%BinLogDir%\Microsoft.Maui.binlog