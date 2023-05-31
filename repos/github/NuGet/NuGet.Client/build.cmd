call configure.cmd

REM Attempt to disable VS extension deployment

set DeployExtension=false

call build.cmd -Binlog -SkipUnitTest

echo dir %SrcDir%
dir %SrcDir%

echo dir .
dir .

echo mkdir %BinLogDir%
mkdir %BinLogDir%

echo move msbuild.build.binlog %BinLogDir%
move msbuild.build.binlog %BinLogDir%

echo move %SrcDir%\msbuild.build.binlog %BinLogDir%
move %SrcDir%\msbuild.build.binlog %BinLogDir%