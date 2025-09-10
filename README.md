<p align="center">
  <img src="https://readme-typing-svg.herokuapp.com?font=Fira+Code&size=52&pause=1000&center=true&vCenter=true&width=900&lines=ML4S+|+My+Linux+for+School;Hyprland+Rice+on+EndeavourOS;Aesthetic+productive+layout.&duration=6000&color=00CCCC;66FFFF;99FFEE;33FFDD;00CCCC">
</p>

<div align="center">
    <h1>【 leo-hale's Hyprland dotfiles 】</h1>
</div>

<div align="center"> 

![](https://img.shields.io/github/last-commit/LeoJHale/ML4S---My%2D%2D%2DMy-linux-for-school?style=for-the-badge&color=8ad7eb&logo=git&logoColor=D9E0EE&labelColor=1E202B)
![](https://img.shields.io/github/stars/LeoJHale/ML4S---My%2D%2D%2DMy-linux-for-school?style=for-the-badge&logo=andela&color=86dbd7&logoColor=D9E0EE&labelColor=1E202B)
![](https://img.shields.io/github/repo-size/LeoJHale/ML4S---My%2D%2D%2DMy-linux-for-school?color=86dbce&label=SIZE&logo=protondrive&style=for-the-badge&logoColor=D9E0EE&labelColor=1E202B)

</div>

<div align="center">
    <h2>• overview •</h2>
</div>

<details> 
  <summary>Features</summary>
     
  - **Hyprland setup**: Clean and minimal config
  - **Dynamic colors**: Wallpaper-based themes (Matugen / Pywal / Wallust)
  - **Waybar / Panels**: Custom status bar with modules
  - **Lightweight install**: Easy to set up on Arch or Arch-based distros
</details>

<details>
  <summary>Software overview</summary>

  | Software | Purpose |
  | ------------- | ------------- |
  | [Hyprland](https://github.com/hyprwm/hyprland) | Wayland compositor |
  | [Waybar](https://github.com/Alexays/Waybar) (or Hyprpanel) | Status bar |
  | [Matugen / Pywal / Wallust](https://github.com) | Wallpaper-based color generation |
  | [Kitty / Alacritty](https://github.com) | Terminal emulator |
</details>


# ML4S
**My Linux for School (ML4S)** is a customized Hyprland rice on EndeavourOS, designed to balance aesthetics with productivity.  
It builds on a minimal Arch base and adds carefully tuned configs, scripts, and utilities to create a fast, distraction-free workflow.  

Key highlights include:
- **Dynamic theming**: Wallpaper-aware color schemes across the system.  
- **Streamlined navigation**: App launchers, keybinds, and window rules for efficient multitasking.  
- **Practical tools**: Integration of everyday utilities for schoolwork and coding.  

The goal of ML4S is to provide a **functional yet visually appealing Linux setup** that makes studying and working smoother.

<p align="center">────────────────────────────</p>

## Showcase

| Status bar & widgets | Window management |
|:---:|:---:|
| (screenshot here) | (screenshot here) |

| Dynamic colors | Terminal & apps |
|:---:|:---:|
| (screenshot here) | (screenshot here) |

<p align="center">────────────────────────────</p>

## Progress Checklist
- [ ] Set up the base for Hyprland – terminal, bar, shell
- [ ] Configure chezmoi for dotfile management

<p align="center">────────────────────────────</p>

## Future Plans
- Add notification daemon (swaync or mako)
- Add rofi/wofi launcher setup
- Add color scheme integration (pywal/matugen)
- Improve README with screenshots

<p align="center">────────────────────────────</p>

## Packages / Components
- **Window Manager:** Hyprland  
- **Bar:** (deciding) Waybar / Hyprpanel  
- **Terminal:** Kitty / Alacritty  
- **Launcher:** Rofi / Wofi  
- **Shell:** Zsh + Starship  
- **Notifications:** swaync / mako (TBD)  
- **Extras:** playerctl, brightnessctl, grim/slurp (screenshots), nwg-look  

<p align="center">────────────────────────────</p>

## Screenshots
*(coming soon)*

<p align="center">────────────────────────────</p>

## Setup
Managed with [chezmoi](https://www.chezmoi.io/).

```bash
chezmoi init git@github.com:LeoJHale/ML4S---My-linux-for-school.git
chezmoi apply
