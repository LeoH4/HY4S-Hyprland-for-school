<p align="center">
  <img src="https://readme-typing-svg.herokuapp.com?font=Fira+Code&size=24&pause=1000&color=00FF00&center=true&vCenter=true&width=600&lines=ML4S+|+My+Linux+for+School;Hyprland+Rice+on+EndeavourOS;Managed+with+chezmoi">
</p>

<div style="background-color:#000000; color:#00FF00; padding:20px; font-family:'Fira Code', monospace;">

# ML4S
**My Linux for School** – Hyprland rice on EndeavourOS, managed with chezmoi.

---

## Progress Checklist
- [ ] Set up chezmoi for dotfile management
- [ ] Add Hyprland config (hyprland.conf)
- [ ] Add Waybar OR Hyprpanel config (decide which one)
- [ ] Add Kitty config
- [ ] Add Zsh config (.zshrc, starship.toml)
- [ ] Add wallpapers
- [ ] Add custom scripts
- [ ] Write install/setup script

---

## Current Work
- Experimenting with Hyprpanel vs Waybar
- Testing different terminal configs (Kitty vs Alacritty)
- Adjusting Hyprland keybinds

---

## Future Plans
- Add notification daemon (swaync or mako)
- Add rofi/wofi launcher setup
- Add color scheme integration (pywal/matugen)
- Improve README with screenshots

---

## Packages / Components
- **Window Manager:** Hyprland
- **Bar:** (deciding) Waybar / Hyprpanel
- **Terminal:** Kitty / Alacritty
- **Launcher:** Rofi / Wofi
- **Shell:** Zsh + Starship
- **Notifications:** swaync / mako (TBD)
- **Extras:** playerctl, brightnessctl, grim/slurp (screenshots), nwg-look

---

## Screenshots
*(coming soon)*

---

## Setup
Managed with [chezmoi](https://www.chezmoi.io/).

```bash
chezmoi init git@github.com:USERNAME/ML4S.git
chezmoi apply
