<p align="center">
  <img src="https://readme-typing-svg.herokuapp.com?font=Fira+Code&size=52&pause=1000&center=true&vCenter=true&width=900&lines=ML4S+|+My+Linux+for+School;Hyprland+Rice+on+EndeavourOS;Aesthetic+productive+layout.&duration=6000&color=00CCCC;66FFFF;99FFEE;33FFDD;00CCCC">
</p>

<div align="center">
    <h1>【 leo-hale's Hyprland dotfiles 】</h1>
</div>

<div align="center"> 

![](https://img.shields.io/github/last-commit/LeoJHale/ML4S-My-linux-for-school?&style=for-the-badge&color=8ad7eb&logo=git&logoColor=D9E0EE&labelColor=1E202B)
![](https://img.shields.io/github/stars/LeoJHale/ML4S-My-linux-for-school?style=for-the-badge&logo=andela&color=86dbd7&logoColor=D9E0EE&labelColor=1E202B)
![](https://img.shields.io/github/repo-size/LeoJHale/ML4S-My-linux-for-school?color=86dbce&label=SIZE&logo=protondrive&style=for-the-badge&logoColor=D9E0EE&labelColor=1E202B)

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
**My Linux for School** – A polished Hyprland setup built on EndeavourOS, designed to balance **aesthetics and productivity** for daily use.  
This configuration focuses on efficiency with a tiling window manager, dynamic theming based on wallpapers, and carefully chosen tools for school and workflow.   

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
- [ ] Set up the base for hyprland - terminal, bar, shell
- [ ] Set up chezmoi for dotfile management
- [ ] Add notification daemon (swaync or mako)
- [ ] Add rofi/wofi launcher setup
- [ ] Add hyprpaper and swww for wallpaper management
- [ ] Add color scheme integration (pywal/matugen)
- [ ] Add hypridle, hyprlock and wlogout

<p align="center">────────────────────────────</p>

## Future Plans
- Finish the bar layout
- Custom scripts for theming of rofi, swaync and hypridle, hyprlock, wlogout
- Add a keybind command cheat sheet that updates custom keybinds
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

## Setup
Managed with [chezmoi](https://www.chezmoi.io/).

```bash
chezmoi init git@github.com:LeoJHale/ML4S-My-linux-for-school.git
chezmoi apply
