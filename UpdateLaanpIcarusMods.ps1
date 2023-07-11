# Display script explanation to the user
Write-Host "This script automates the process of downloading and installing mods for the game 'Icarus' in your Steam library."
Write-Host "It retrieves the latest mod release from a specific GitHub repository and installs it into the appropriate folder."
Write-Host "Please follow the prompts and provide the required information when prompted."

$url = "https://api.github.com/repos/laanp/Icarus_Mods/releases/latest"
$response = Invoke-WebRequest -Uri $url
$json = $response.Content | ConvertFrom-Json
$browser_download_url = $json.assets[0].browser_download_url

# Prompt the user to enter the Steam library path or use the saved value
$defaultSteamLibraryPath = "C:\Program Files (x86)\Steam\steamapps\common\"
$steamLibraryConfigPath = Join-Path $env:APPDATA "SteamLibraryConfig.txt"
if (Test-Path $steamLibraryConfigPath) {
    $SteamLibraryPath = Get-Content $steamLibraryConfigPath
}
else {
    $SteamLibraryPath = Read-Host "Enter the path to the Steam library (default: $defaultSteamLibraryPath)"
    $SteamLibraryPath | Set-Content -Path $steamLibraryConfigPath
}

# Use default path if user input is empty
if ([string]::IsNullOrWhiteSpace($SteamLibraryPath)) {
    $SteamLibraryPath = $defaultSteamLibraryPath
}

# Append the necessary subdirectories to the Steam library path
$IcarusPath = Join-Path $SteamLibraryPath "Icarus\Icarus\Content\Paks"

# Create "Mods" folder if it doesn't exist
$modsFolderPath = Join-Path $IcarusPath "Mods"
if (-not (Test-Path $modsFolderPath)) {
    New-Item -ItemType Directory -Path $modsFolderPath | Out-Null
}

# Extract the filename from the URL
$fileName = [System.IO.Path]::GetFileName($browser_download_url)

# Set the download path to the current user's download directory with the extracted filename
$downloadPath = Join-Path $env:USERPROFILE "Downloads\$fileName"
Invoke-WebRequest -Uri $browser_download_url -OutFile $downloadPath

# Remove old files in the Mods folder
$modsFiles = Get-ChildItem -Path $modsFolderPath -File -Force
if ($modsFiles) {
    foreach ($file in $modsFiles) {
        Remove-Item -Path $file.FullName -Force
    }
}

# Extract the downloaded file to the Mods folder using built-in Windows ZIP extraction
$shell = New-Object -ComObject Shell.Application
$destinationFolder = $shell.NameSpace($modsFolderPath)
$sourceFile = $shell.NameSpace($downloadPath)
$destinationFolder.CopyHere($sourceFile.Items(), 16)

# Remove the downloaded ZIP file
Remove-Item -Path $downloadPath -Force
