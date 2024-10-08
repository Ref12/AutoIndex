pushd "C:\Program Files (x86)\Microsoft Visual Studio\Installer\"
for /f "delims=" %%x in ('.\vswhere.exe -latest -property InstallationPath') do set VSPATH=%%x
popd
call "%VSPATH%\VC\Auxiliary\Build\vcvarsall.bat" x64

@echo on

echo VCToolsVersion=%VCToolsVersion%

set MSVC_VERSION=%VCToolsVersion%

set BUILDXL_LOG_DIR=%CodexDebugDir%/bxllogs

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

echo ----- Running Codex script analyzer -----

call %SrcDir%\bxl.cmd -DoNotUseDefaultCacheConfigFilePath -DeployDev /server- ^
/cacheConfigFilePath:%CodexBuildTempDir%/bxlcache/cacheconfig.json

subst B: %SrcDir%

call %SrcDir%\Out\Selfhost\Dev\bxlScriptAnalyzer.exe /a:Codex /c:B:\config.dsc /o:%CDXDSC_OUTPUT_DIR%