curl -o "%CodexBuildTempDir%\dotnet-install.ps1" "https://dotnet.microsoft.com/download/dotnet/scripts/v1/dotnet-install.ps1"

powershell -NoLogo -NoProfile -ExecutionPolicy Bypass -Command "%CodexBuildTempDir%\dotnet-install.ps1 %*"

dotnet --version