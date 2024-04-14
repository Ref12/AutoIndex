set BUILDXL_LOG_DIR=%CodexDebugDir%\bxllogs

echo ----- Writing cache config -----

set BUILDXL_LOCAL_CACHE_DIRECTORY=%CodexBuildTempDir%/bxlcache
set BUILDXL_REMOTE_CACHE_DIRECTORY=Z:/bxlcache

set BXL_CACHE_CONFIG_PATH="%~dp0/writeconfig.ps1"

powershell -NoLogo -NoProfile -ExecutionPolicy Bypass -Command %BXL_CACHE_CONFIG_PATH%

set CSARGS_OUTPUT_DIR==%CodexDebugDir%\csargs

echo ----- Running BuildXL build -----

call %SrcDir%\bxl.cmd -DoNotUseDefaultCacheConfigFilePath /f:tag='compile' /q:Debug /incrementalScheduling- /enableLazyOutputs- /logsDirectory:%BUILDXL_LOG_DIR% /logExecution ^
/cacheConfigFilePath:%BXL_CACHE_CONFIG_PATH%

echo ----- Running Codex execution analyzer -----

call %SrcDir%\bxlanalyzer.cmd /mode:Codex /xl:%BUILDXL_LOG_DIR% /o:%CSARGS_OUTPUT_DIR%

echo ----- Running Codex script analyzer -----

REM call %SrcDir%\bxlanalyzer.cmd /mode:Codex /xl:%BUILDXL_LOG_DIR% /o:%CSARGS_OUTPUT_DIR%