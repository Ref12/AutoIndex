REM Add Directory.build.rsp which specifies that binlog should be produced
move "..\..\..\.build\Binlog.Directory.build.rsp" "%SrcDir%\..\Directory.build.rsp"

dir "%SrcDir%\.."

REM Call build
call "%SrcDir%\build.cmd"