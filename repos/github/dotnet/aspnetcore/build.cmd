REM call npm install -g node

REM call "%SrcDir%\restore.cmd"

REM Build using arcade build logic

call "%SrcDir%\eng\build.cmd" -ci -prepareMachine -binarylog -arch x64

call "%CodexBuildConfigRoot%\arcade.copybinlogs.cmd"