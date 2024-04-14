set BUILDXL_LOG_DIR=Z:\bxllogs2

echo ----- Writing cache config -----

set BUILDXL_LOCAL_CACHE_DIRECTORY=%CodexBuildTempDir%/bxlcache
set BUILDXL_REMOTE_CACHE_DIRECTORY=Z:/bxlcachefs

set BXL_CACHE_CONFIG_PATH="%~dp0/writeconfig.ps1"

powershell -NoLogo -NoProfile -ExecutionPolicy Bypass -Command "%~dp0/writeconfig.ps1"

set CSARGS_OUTPUT_DIR==%CodexDebugDir%\csargs

echo ----- Running BuildXL build -----

call %SrcDir%\bxl.cmd -DoNotUseDefaultCacheConfigFilePath "/f:(requiredfor(tag='compile')) and ~(dpc(id='Pip3CB982272DD212B2'))" /q:Debug /incrementalScheduling- /logsDirectory:%BUILDXL_LOG_DIR% /logExecution /server- ^
/cacheConfigFilePath:%CodexBuildTempDir%/bxlcache/cacheconfig.json

echo ----- Running Codex execution analyzer -----

call %SrcDir%\bxlanalyzer.cmd /mode:Codex /xl:%BUILDXL_LOG_DIR% /o:%CSARGS_OUTPUT_DIR%

echo ----- Running Codex script analyzer -----

REM call %SrcDir%\bxlanalyzer.cmd /mode:Codex /xl:%BUILDXL_LOG_DIR% /o:%CSARGS_OUTPUT_DIR%