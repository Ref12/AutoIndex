call npm install -g node

call "%SrcDir%\restore.cmd"

REM Build using arcade build logic

call "%SrcDir%\eng\build.cmd" -buildManaged -binarylog -arch x64

call "%CodexBuildConfigRoot%\arcade.copybinlogs.cmd"