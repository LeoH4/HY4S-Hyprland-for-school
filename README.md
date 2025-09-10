<p align="center">
  <img src="https://readme-typing-svg.herokuapp.com?font=Fira+Code&size=52&pause=1000&center=true&vCenter=true&width=900&lines=ML4S+|+My+Linux+for+School;Hyprland+Rice+on+EndeavourOS;An+aesthetic+productive+layout.&duration=6000&color=00CCCC;66FFFF;99FFEE;33FFDD;00CCCC">
</p>

<div align="center">
    <h1>【 leo-hale's Hyprland dotfiles 】</h1>
</div>

<div align="center"> 

![](https://img.shields.io/github/last-commit/leo-hale/hyprland-dots?&style=for-the-badge&color=8ad7eb&logo=git&logoColor=D9E0EE&labelColor=1E202B)
![](https://img.shields.io/github/stars/leo-hale/hyprland-dots?style=for-the-badge&logo=andela&color=86dbd7&logoColor=D9E0EE&labelColor=1E202B)
![](https://img.shields.io/github/repo-size/leo-hale/hyprland-dots?color=86dbce&label=SIZE&logo=protondrive&style=for-the-badge&logoColor=D9E0EE&labelColor=1E202B)

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
  <summary>Installation</summary>

   - Clone this repo:
     ```bash
     git clone https://github.com/leo-hale/hyprland-dots ~/.config/hypr
     ```
   - Install required packages (see `arch-packages/`)
   - Restart Hyprland
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
**My Linux for School** – Hyprland rice on EndeavourOS. A highly configured Arch setup based on the window tiling manager Hyprland, with custom and borrowed scripts to improve productivity while still being beautiful. Including, dynamic colouring for all UI based on wallpaper colour schemes, app launchers and more powered with rofi and many more. 

<p align="center">────────────────────────────</p>

## Progress Checklist
- [ ] Set up the base for hyprland - terminal, bar, shell
- [ ] Set up chezmoi for dotfile management


<p align="center">────────────────────────────</p>

## Current Work
<p align="center">
  <img src="https://readme-typing-svg.herokuapp.com?font=Fira+Code&size=32&pause=1000&center=true&vCenter=true&width=700&lines=Experimenting+with+Hyprpanel+vs+Waybar;Testing+terminal+configs;Adjusting+keybinds&duration=5000&color=00CCCC;66FFFF">
</p>

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
chezmoi init git@github.com:USERNAME/ML4S.git
chezmoi apply
