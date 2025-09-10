<p align="center">
  <img src="https://readme-typing-svg.herokuapp.com?font=Fira+Code&size=52&pause=1000&center=true&vCenter=true&width=900&lines=HY4S+|+My+Linux+for+School;Hyprland+Rice+on+EndeavourOS;Aesthetic+productive+layout.&duration=6000&color=00CCCC;66FFFF;99FFEE;33FFDD;00CCCC">
</p>

<div align="center">
    <h1>【 My Hyprland dotfiles 】</h1>
</div>

<div align="center"> 
[![Last Commit](https://img.shields.io/github/last-commit/LeoJHale/HY4S?style=for-the-badge&color=8ad7eb&logo=git&logoColor=D9E0EE&labelColor=1E202B)](https://github.com/LeoJHale/HY4S/commits/main)
[![Stars](https://img.shields.io/github/stars/LeoJHale/HY4S?style=for-the-badge&color=86dbd7&logo=andela&logoColor=D9E0EE&labelColor=1E202B)](https://github.com/LeoJHale/HY4S/stargazers)
[![Repo Size](https://img.shields.io/github/repo-size/LeoJHale/HY4S?style=for-the-badge&color=86dbce&logo=protondrive&logoColor=D9E0EE&labelColor=1E202B)](https://github.com/LeoJHale/HY4S)
</div>

<p align="center">────────────────────────────</p>

<!-- Nav Bar -->
<div align="center">
<h1><a href="#overview"><kbd>Overview</kbd></a>&ensp;
<a href="#screenshots"><kbd>Screenshots</kbd></a>&ensp;
<a href="#progress-checklist"><kbd>Progress</kbd></a>&ensp;
<a href="#future-plans"><kbd>Future Plans</kbd></a>&ensp;
<a href="#setup"><kbd>Setup</kbd></a></h1>
</div>


<p align="center">────────────────────────────</p>

## <a id="overview"></a>Overview
<div align="center">
**Coming Soon**
</div>
<p align="center">A polished Hyprland setup on EndeavourOS with dynamic wallpaper-based themes, a clean tiling WM layout, and productivity-focused tools.</p>

<p align="center">────────────────────────────</p>

## <a id="screenshots"></a>Screenshots

<details>
<summary>Theme</summary>
<p align="center">
**Coming Soon**
</p>
</details>

<details>
<summary>Theme Select</summary>
<p align="center">
**Coming Soon**
</p>
</details>

<details>
<summary>Wallpaper</summary>
<p align="center">
**Coming Soon**
</p>
</details>

<details>
<summary>Lock Screen</summary>
<p align="center">
**Coming Soon**
</p>
</details>

<details>
<summary>Menu</summary>
<p align="center">
**Coming Soon**
</p>
</details>

<details>
<summary>Power Menu</summary>
<p align="center">
**Coming Soon**
</p>
</details>

<details>
<summary>Login Screen (sddm)</summary>
<p align="center">
**Coming Soon**
</p>
</details>

<p align="center">────────────────────────────</p>

## <a id="progress-checklist"></a>Progress Checklist
- [x] Set up the base for Hyprland – terminal, bar, shell  
- [x] Set up chezmoi for dotfile management  
- [ ] Add notification daemon (swaync or mako)  
- [ ] Add rofi/wofi launcher setup  
- [ ] Add hyprpaper and swww for wallpaper management  
- [ ] Add color scheme integration (pywal/matugen)  
- [ ] Add hypridle, hyprlock, and wlogout  

<p align="center">────────────────────────────</p>

## <a id="future-plans"></a>Future Plans
- Finish the bar layout  
- Add audio controls  
- Add screenshot function  
- Custom scripts for theming rofi, swaync, hypridle, hyprlock, wlogout  
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

## <a id="setup"></a>Setup
Managed with [chezmoi](https://www.chezmoi.io/):

```bash
chezmoi init git@github.com:LeoJHale/HY4S.git
chezmoi apply
