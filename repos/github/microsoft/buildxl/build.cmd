set BUILDXL_LOG_DIR=%CodexDebugDir%\bxllogs

set CSARGS_OUTPUT_DIR==%CodexDebugDir%\csargs

echo ----- Running BuildXL build -----

call %SrcDir%\bxl.cmd /f:tag='compile' /q:Debug /incrementalScheduling- /enableLazyOutputs- /logsDirectory:%BUILDXL_LOG_DIR%

echo ----- Running Codex execution analyzer -----

call %SrcDir%\bxlanalyzer.cmd /mode:Codex /xl:%BUILDXL_LOG_DIR% /o:%CSARGS_OUTPUT_DIR%

echo ----- Running Codex script analyzer -----

REM call %SrcDir%\bxlanalyzer.cmd /mode:Codex /xl:%BUILDXL_LOG_DIR% /o:%CSARGS_OUTPUT_DIR%