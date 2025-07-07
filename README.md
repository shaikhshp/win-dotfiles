# Windows Tiling & Status Bar Setup

This repository provides a turnkey setup for a tiling window manager, status bar, and related tools on Windows. It includes:

- **PowerShell installer script** (`install-dotfiles.ps1`)  
- **Komorebi** layout configuration (`komorebi.json`) 
- **YASB** status-bar config (`config.yaml`) 
- **WHKD** hotkey daemon config (`whkdrc`)  
- **Custom CSS** for YASB styling (`styles.css`)  

---

## Prerequisites

- **Windows 10 or 11**  
- **[WinGet](https://docs.microsoft.com/windows/package-manager/winget/)** (comes with recent Windows versions)  
- **PowerShell 7+** (for running the installer script)

---

## Installation

1. **Clone the repo**  
   ```powershell
   git clone https://github.com/shaikhshp/win-dotfiles.git
   cd windows-dotfiles
   ```

2. **Run the installer**

   ```powershell
   .\install-dotfiles.ps1
   ```

   This script will:

   * Install JetBrainsMono Nerd Font
   * Install LibreHardwareMonitor
   * Install WHKD
   * Install YASB
   * Install Komorebi
   * Move `komorebi.json`, `applications.yaml`, and `applications.json` → `~\.config`
   * Delete & replace `config.yaml` and `style.css` in `~\.config\yasb\`
   * Move `whkdrc` → `~\.config\whkdrc`

3. **Start your environment**

   * Launch **Komorebi** (e.g. via your Start menu or run `komorebic start --whkd`)
   * Launch **YASB** (`yasb`)

---

## File Descriptions

| File                   | Purpose                                                                    |
| ---------------------- | -------------------------------------------------------------------------- |
| `install-dotfiles.ps1` | PowerShell script to install tools via WinGet and deploy your config files |
| `komorebi.json`        | Komorebi tiling-WM configuration (workspaces, border, theme)               |
| `config.yaml`          | Main YASB status-bar configuration (bars, widgets, Komorebi integration)   |
| `whkdrc`               | WHKD hotkey definitions (key bindings for window management)               |
| `styles.css`           | CSS overrides for YASB styling (colors, fonts, padding)                    |

---

## Customization

* **Workspaces & Layouts**
  Adjust `komorebi.json` to add/remove workspaces or change tiling layouts.
* **Status-Bar Widgets**
  Tweak `config.yaml` to enable/disable widgets, change intervals, labels, or callbacks.
* **Styling**
  Modify `styles.css` for font sizes, colors, or widget padding.

After making changes, restart Komorebi and YASB:

```powershell
komorebic reload --whkd
yasb --reload
```

---

## Troubleshooting

* **Script Errors**
  Ensure PowerShell is running as Administrator and that WinGet is up to date.
* **Missing Fonts or Icons**
  Confirm JetBrainsMono Nerd Font installed successfully via Settings → Fonts.
* **Widgets Not Showing**
  Check that `~\.config\yasb\config.yaml` exists and is valid YAML. Run `yasb --debug` for logs.

---

