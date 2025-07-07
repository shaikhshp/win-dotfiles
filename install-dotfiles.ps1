# install-dotfiles.ps1

# 1. Install JetBrainsMono Nerd Font
Write-Host "Installing JetBrainsMono Nerd Font..."
winget install --id=DEVCOM.JetBrainsMonoNerdFont -e

# 2. Install LibreHardwareMonitor
Write-Host "Installing LibreHardwareMonitor..."
winget install --id=LibreHardwareMonitor.LibreHardwareMonitor -e

# 3. Install WHKD (hotkey daemon)
Write-Host "Installing whkd..."
winget install --id=LGUG2Z.whkd -e

# 4. Install YASB (Yet Another Status Bar)
Write-Host "Installing YASB..."
winget install --id=AmN.yasb -e

# 5. Install Komorebi (tiling window manager)
Write-Host "Installing komorebi..."
winget install --id=LGUG2Z.komorebi -e

# 6. Prepare config directories
$homedir      = [Environment]::GetFolderPath("UserProfile")
$configDir = Join-Path $homedir ".config"
$yasbDir   = Join-Path $configDir "yasb"

# Ensure the directories exist
New-Item -ItemType Directory -Path $configDir -Force  | Out-Null
New-Item -ItemType Directory -Path $yasbDir  -Force  | Out-Null

# 7. Move komorebi.json into ~/.config/
if (Test-Path ".\komorebi.json") {
    Move-Item ".\komorebi.json" $configDir -Force
    Write-Host "Moved komorebi.json to $configDir"
} else {
    Write-Warning "komorebi.json not found in repo root."
}

# 8. Replace YASB config.yaml
$yasbConfig = Join-Path $yasbDir "config.yaml"
if (Test-Path $yasbConfig) {
    Remove-Item $yasbConfig -Force
    Write-Host "Deleted existing $yasbConfig"
}
if (Test-Path ".\config.yaml") {
    Move-Item ".\config.yaml" $yasbDir -Force
    Write-Host "Moved config.yaml to $yasbDir"
} else {
    Write-Warning "config.yaml not found in repo root."
}

# 9. Move whkdrc into ~/.config/
if (Test-Path ".\whkdrc") {
    Move-Item ".\whkdrc" $configDir -Force
    Write-Host "Moved whkdrc to $configDir"
} else {
    Write-Warning "whkdrc not found in repo root."
}

# 10. Move styles.css into ~/.config/yasb/
if (Test-Path ".\styles.css") {
    Move-Item ".\styles.css" $yasbDir -Force
    Write-Host "Moved styles.css to $yasbDir"
} else {
    Write-Warning "styles.css not found in repo root."
}

# 11. Move applications.yaml into ~/.config/
if (Test-Path ".\applications.yaml") {
    Move-Item ".\applications.yaml" $configDir -Force
    Write-Host "Moved applications.yaml to $configDir"
} else {
    Write-Warning "applications.yaml not found in repo root."
}

# 12. Move applications.json into ~/.config/
if (Test-Path ".\applications.json") {
    Move-Item ".\applications.json" $configDir -Force
    Write-Host "Moved applications.json to $configDir"
} else {
    Write-Warning "applications.json not found in repo root."
}

Write-Host "Setup complete."
