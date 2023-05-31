echo TryRestore: src/Uno.UI.sln
echo dotnet restore src/Uno.UI.sln
dotnet restore src/Uno.UI.sln

echo mkdir %BinLogDir%
mkdir %BinLogDir%

mkdir %BinLogDir%
echo TryBuild: src/Uno.UI.sln
echo dotnet build src/Uno.UI.sln /bl:%BinLogDir%/Uno.UI.binlog
dotnet build src/Uno.UI.sln /bl:%BinLogDir%/Uno.UI.binlog