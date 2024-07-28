REM Build using arcade build logic
powershell -NoLogo -NoProfile -ExecutionPolicy Bypass -Command "eng/common/build.ps1 -restore -build -binarylog -nodeReuse:$false %*"

call "%CodexBuildConfigRoot%\arcade.copybinlogs.cmd"