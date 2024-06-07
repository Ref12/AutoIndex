REM Disable nuget signature validation
nuget config -set signatureValidationMode=accept -ConfigFile "%SrcDir%/src/nuget.config"