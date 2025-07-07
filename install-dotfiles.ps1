# 1. Install JetBrainsMono Nerd Font
Write-Host "Installing JetBrainsMono Nerd Font..."
winget install --id=DEVCOM.JetBrainsMonoNerdFont -e  # :contentReference[oaicite:0]{index=0}

# 2. Install LibreHardwareMonitor
Write-Host "Installing LibreHardwareMonitor..."
winget install --id=LibreHardwareMonitor.LibreHardwareMonitor -e  # :contentReference[oaicite:1]{index=1}

# 3. Install whkd (hotkey daemon)
Write-Host "Installing whkd..."
winget install --id=LGUG2Z.whkd -e  # :contentReference[oaicite:2]{index=2}

# 4. Install YASB (Yet Another Status Bar)
Write-Host "Installing YASB..."
winget install --id=AmN.yasb -e  # :contentReference[oaicite:3]{index=3}

# 5. Install komorebi (tiling window manager)
Write-Host "Installing komorebi..."
winget install --id=LGUG2Z.komorebi -e  # :contentReference[oaicite:4]{index=4}

# 6. Prepare config directories
$homedir        = [Environment]::GetFolderPath("UserProfile")
$configDir   = Join-Path $homedir ".config"
$yasbDir     = Join-Path $configDir "yasb"

# Ensure the directories exist
New-Item -ItemType Directory -Path $configDir -Force   | Out-Null
New-Item -ItemType Directory -Path $yasbDir   -Force   | Out-Null

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

Write-Host "Setup complete."
