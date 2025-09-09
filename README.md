<p align="center">
  <img src="https://raw.githubusercontent.com/leohale/ML4S/main/assets/ML4S_gradient.svg" alt="ML4S Animated Banner">
</p>


# ML4S
**My Linux for School** – Hyprland rice on EndeavourOS, managed with chezmoi.

<p align="center">────────────────────────────</p>

## Progress Checklist
- [ ] Set up chezmoi for dotfile management
- [ ] Add Hyprland config (hyprland.conf)
- [ ] Add Waybar OR Hyprpanel config (decide which one)
- [ ] Add Kitty config
- [ ] Add Zsh config (.zshrc, starship.toml)
- [ ] Add wallpapers
- [ ] Add custom scripts
- [ ] Write install/setup script

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
