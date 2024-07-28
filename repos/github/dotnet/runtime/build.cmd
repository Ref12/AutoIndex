REM Build using arcade build logic
build.cmd clr+libs -rc Debug -binaryLog

REM Copy binlogs from arcade logs folder
call "%CodexBuildConfigRoot%\arcade.copybinlogs.cmd"
