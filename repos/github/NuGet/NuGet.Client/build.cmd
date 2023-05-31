call configure.cmd

REM Attempt to disable VS extension deployment

set DeployExtension=false

call build.cmd -Binlog -SkipUnitTest

move %SrcDir%/msbuild.build.binlog %BinLogDir%