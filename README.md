# Windows Tiling & Status Bar Setup

This repository provides a turnkey setup for a tiling window manager, status bar, and related tools on Windows. It includes:

* **PowerShell installer script** (`install-dotfiles.ps1`)
* **Komorebi** layout configuration (`komorebi.json`)
* **YASB** status-bar config (`config.yaml`)
* **WHKD** hotkey daemon config (`whkdrc`)
* **Custom CSS** for YASB styling (`styles.css`)
* **Application launcher definitions** (`applications.yaml`, `applications.json`)

---

## Prerequisites

* **Windows 10 or 11**
* **[WinGet](https://docs.microsoft.com/windows/package-manager/winget/)** (included in recent Windows versions)
* **PowerShell 7+** (for running the installer script)

---

## Installation

1. **Clone the repo**

   ```powershell
   git clone https://github.com/shaikhshp/win-dotfiles.git
   cd win-dotfiles
   ```

2. **Run the installer**

   ```powershell
   .\install-dotfiles.ps1
   ```

   The script will:

   * Install JetBrainsMono Nerd Font
   * Install LibreHardwareMonitor
   * Install WHKD
   * Install YASB
   * Install Komorebi
   * Move `komorebi.json`, `applications.yaml`, and `applications.json` → `~\.config`
   * Delete & replace `config.yaml`, move `styles.css` → `~\.config\yasb`
   * Move `whkdrc` → `~\.config`

3. **Launch your setup**

   * Start **LibreHardwareMonitor** (`librehardwaremonitor`) and start Remote Web Server (Options, Remote Web Server, Run)
   * Start **Komorebi** (e.g., via Start menu or `komorebic start --whkd`)
   * Start **YASB** (`yasb`)

---

## File Descriptions

| File                   | Purpose                                                      |
| ---------------------- | ------------------------------------------------------------ |
| `install-dotfiles.ps1` | Installer script (WinGet + config deployment)                |
| `komorebi.json`        | Komorebi tiling window manager layout                        |
| `config.yaml`          | YASB status-bar configuration                                |
| `styles.css`           | Custom CSS overrides for YASB styling                        |
| `whkdrc`               | WHKD hotkey definitions                                      |
| `applications.yaml`    | Application launcher entries (YASB widget/Komorebi mappings) |
| `applications.json`    | Same launcher definitions in JSON format                     |

---

## Customization

* **Workspaces & Layouts**: Edit `komorebi.json` to adjust workspace names, layouts, and themes.
* **Widgets & Commands**: Tweak `config.yaml` to configure widgets, polling intervals, and commands.
* **Harware Monitoring** Update sensor IDs in `config.yaml` for your hardware.
* **Styling**: Modify `styles.css` for font sizes, colors, and padding.

After changes, reload:

```powershell
komorebic reload --whkd
yasb --reload
```

---

## Troubleshooting

* **Permissions**: Run PowerShell as Administrator to ensure WinGet installs correctly.
* **Font Issues**: Check Windows Font settings to verify JetBrainsMono Nerd Font installation.
* **YASB Errors**: Ensure `~\.config\yasb\config.yaml` and `styles.css` exist and contain valid YAML/CSS. Use `yasb --debug` for logs.