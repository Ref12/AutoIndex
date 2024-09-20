@echo on

set BUILDXL_LOG_DIR=%CodexDebugDir%/bxllogs

mkdir "%ProgramFiles%/Microsoft Visual Studio/2022/Preview/VC/Tools/MSVC/14.39.33519"
dir "%ProgramFiles%/Microsoft Visual Studio/2022/Preview/VC"
dir "%ProgramFiles%/Microsoft Visual Studio/2022/Preview/VC/Tools"

echo ----- Writing cache config -----

set BUILDXL_LOCAL_CACHE_DIRECTORY=%CodexBuildTempDir%/bxlcache
REM set BUILDXL_REMOTE_CACHE_DIRECTORY=Z:/bxlcachefs

set BXL_CACHE_CONFIG_PATH="%~dp0/writeconfig.ps1"

powershell -NoLogo -NoProfile -ExecutionPolicy Bypass -Command "%~dp0/writeconfig.ps1"

set CSARGS_OUTPUT_DIR=%CodexDebugDir%\csargs
echo CSARGS_OUTPUT_DIR=%CSARGS_OUTPUT_DIR%

set CDXDSC_OUTPUT_DIR=%CodexDebugDir%\cdxdsc
echo CDXDSC_OUTPUT_DIR=%CDXDSC_OUTPUT_DIR%

echo ----- Running BuildXL build -----

call %SrcDir%\bxl.cmd -DoNotUseDefaultCacheConfigFilePath "/f:(requiredfor(tag='telemetry:csc')or(tag='telemetry:csc'))" /q:Debug /incrementalScheduling- ^
/logsDirectory:%BUILDXL_LOG_DIR% /logExecution /server- ^
/cacheConfigFilePath:%CodexBuildTempDir%/bxlcache/cacheconfig.json

echo ----- Running Codex execution analyzer -----

echo CSARGS_OUTPUT_DIR=%CSARGS_OUTPUT_DIR%
echo %SrcDir%\bxlanalyzer.cmd /mode:Codex /xl:%BUILDXL_LOG_DIR% /o:%CSARGS_OUTPUT_DIR%

call %SrcDir%\bxlanalyzer.cmd /mode:Codex /xl:%BUILDXL_LOG_DIR% /o:%CSARGS_OUTPUT_DIR%

subst B: %SrcDir%

echo ----- Running Codex script analyzer -----

call %SrcDir%\bxl.cmd -DoNotUseDefaultCacheConfigFilePath -DeployDev /server- ^
/cacheConfigFilePath:%CodexBuildTempDir%/bxlcache/cacheconfig.json

call %SrcDir%\Out\Selfhost\Dev\bxlScriptAnalyzer.exe /a:Codex /c:%SrcDir%\config.dsc /o:%CDXDSC_OUTPUT_DIR%