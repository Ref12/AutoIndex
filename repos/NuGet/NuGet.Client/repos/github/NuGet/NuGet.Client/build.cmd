configure.cmd

REM Attempt to disable VS extension deployment

set DeployExtension=false

build.cmd -Binlog -SkipUnitTest

move %SrcDir%/msbuild.build.binlog %BinLogDir%