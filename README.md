<p align="left">
  <img src="https://readme-typing-svg.herokuapp.com?font=Fira+Code&size=52&pause=50&center=false&vCenter=true&width=900&lines=HY4S+|+Hyprland+for+School;Hyprland+Rice+on+EndeavourOS;Aesthetic+productive+layout.&duration=6000&color=DCFFC2">
</p>

<h1>【 My Hyprland dotfiles 】</h1>

[![Last Commit](https://img.shields.io/github/last-commit/LeoH4/HY4S-Hyprland-for-school?style=for-the-badge&color=DCFFC2&logo=git&logoColor=D9E0EE&labelColor=1E202B)](https://github.com/LeoH4/HY4S-Hyprland-for-school/commits/main)
[![Stars](https://img.shields.io/github/stars/LeoH4/HY4S-Hyprland-for-school?style=for-the-badge&color=DCFFC2&logo=starship&logoColor=D9E0EE&labelColor=1E202B)](https://github.com/LeoH4/HY4S-Hyprland-for-school/stargazers)
[![Repo Size](https://img.shields.io/github/repo-size/LeoH4/HY4S-Hyprland-for-school?style=for-the-badge&color=DCFFC2&logo=protondrive&logoColor=D9E0EE&labelColor=1E202B)](https://github.com/LeoH4/HY4S-Hyprland-for-school)

<!-- Nav Bar -->
<div align="left">
  <a href="#overview"><kbd style="font-size:28px; background-color:#1E202B; color:#DCFFC2;"> <br> Overview <br> </kbd></a>&ensp;&ensp;
  <a href="#keybinds"><kbd style="font-size:28px; background-color:#1E202B; color:#DCFFC2;"> <br> Keybinds <br> </kbd></a>&ensp;&ensp;
  <a href="#screenshots"><kbd style="font-size:28px; background-color:#1E202B; color:#DCFFC2;"> <br> Screenshots <br> </kbd></a>&ensp;&ensp;
  <a href="#setup"><kbd style="font-size:28px; background-color:#1E202B; color:#DCFFC2;"> <br> Setup <br> </kbd></a>&ensp;&ensp;
  <a href="#future-plans"><kbd style="font-size:28px; background-color:#1E202B; color:#DCFFC2;"> <br> Future Plans <br> </kbd></a>&ensp;&ensp;
  <a href="#packages"><kbd style="font-size:28px; background-color:#1E202B; color:#DCFFC2;"> <br> Packages <br> </kbd></a>&ensp;&ensp;
</div><br>

<a id="overview"></a>
## <img src="https://readme-typing-svg.herokuapp.com?font=Fira+Code&size=36&pause=50&color=DCFFC2&center=false&vCenter=true&width=500&lines=Overview" />

A stable, polished Hyprland setup using Arch linux/EndeavourOS with productivity focused features, while still maintaining a clean aesthetic.

<details>
<summary>Features</summary>
  
- Config navigator
- Keybind cheetsheet
- Easy package updating
- Date tracking/task countdown
- Highly configurable
- Scrolling layout (works the same with dwindle)
- Theme selector (coming soon)
  
</details>

<a id="keybinds"></a>
<details>
<summary>Keybinds</summary>

| Keybind | Action |
|---------|--------|
| `Super + Enter` | Terminal |
| `Super + Q` | Kill active window |
| `Super + L` | Exit Hyprland |
| `Super + E` | File Manager |
| `Super + K` | Keybinds list |
| `Super + N` | Config quick-nav |
| `Super + V` | Toggle floating window |
| `Ctrl + Super + Enter` | Application launcher |
| `Super + B` | Browser |
| `Super + W` | Reload Waybar |
| `Super + F` | Fullscreen |
| `Super + S` | Screenshot (region) |
| `Super + C` | Clipboard manager |
| `Super + .` | Emoji picker |
| `Super + t` | Terminal scratchpad |
| `Super + y` | NeoVim scratchpad |
| `Super + ←` | Move focus left |
| `Super + →` | Move focus right |
| `Super + ↑` | Move focus up |
| `Super + ↓` | Move focus down |
| `Super + 1-10` | Switch to workspace 1-10 |
| `Super + Shift + 1-10` | Move window to workspace 1-10 |
| `Super + Ctrl` | Toggle scratchpad |
| `Super + Ctrl + S` | Move to scratchpad |
| `Super + Scroll Down` | Next workspace |
| `Super + Scroll Up` | Previous workspace |
| `Super + LMB (drag)` | Move window |
| `Super + RMB (drag)` | Resize window |
</details>

<a id="screenshots"></a>
## <img src="https://readme-typing-svg.herokuapp.com?font=Fira+Code&size=36&pause=50&color=DCFFC2&center=false&vCenter=true&width=500&lines=Screenshots" />

<details>
<summary>Wallpapers</summary>
<img width="500" height="270" alt="image" src="https://github.com/user-attachments/assets/0ab8c43e-b87e-4d06-96a5-775de745f255" /> <img width="500" height="270" alt="image" src="https://github.com/user-attachments/assets/1940bf84-8ac0-404a-824c-7ea1d04276cf" /> <img width="500" height="270" alt="image" src="https://github.com/user-attachments/assets/8e92b132-3238-482e-abab-06bdf0214546" /> <img width="500" height="270" alt="image" src="https://github.com/user-attachments/assets/4e78b2d3-714b-42ca-bdb7-9dfae3667ab3" />
</details>

<details>
<summary>Wallpaper select</summary>
**Coming Soon**
</details>

<details>
<summary>Lock Screen</summary>
**Coming Soon**
</details>

<details>
<summary>Menu</summary>
**Coming Soon**
</details>

<details>
<summary>Power Menu</summary>
**Coming Soon**
</details>

<details>
<summary>Login Screen (sddm)</summary>
**Coming Soon**
</details>

<a id="Installation"></a>
## <img src="https://readme-typing-svg.herokuapp.com?font=Fira+Code&size=36&pause=50&color=DCFFC2&center=false&vCenter=true&width=500&lines=Installation" />

<details>
<summary>Auto Install</summary>

> **Requires a fresh Arch / EndeavourOS install with an internet connection.**  
> This will install `yay`, clone the repo to `~/Projects/HY4S/`, install all packages, stow configs, and set fish as your default shell.

```bash
bash <(curl -s https://raw.githubusercontent.com/LeoH4/HY4S-Hyprland-for-school/main/install.sh)
```

To update packages and configs after a future push:
```bash
bash ~/Projects/HY4S/update.sh
```

</details>

<details>
<summary>Manual Install</summary>

**1. Install dependencies**
```bash
sudo pacman -S --needed git stow base-devel
```

**2. Install yay (AUR helper)**
```bash
git clone https://aur.archlinux.org/yay.git ~/yay-tmp
cd ~/yay-tmp && makepkg -si --noconfirm
cd ~ && rm -rf ~/yay-tmp
```

**3. Clone the repo**
```bash
mkdir -p ~/Projects
git clone https://github.com/LeoH4/HY4S-Hyprland-for-school.git ~/Projects/HY4S
```

**4. Install packages**
```bash
yay -S --needed $(grep -v '^\s*#' ~/Projects/HY4S/packages.txt | grep -v '^\s*$' | tr '\n' ' ')
```

**5. Stow dotfiles**
```bash
stow -d ~/Projects/HY4S -t ~/ dotfiles
```

**6. Set fish as default shell**
```bash
chsh -s $(which fish)
```

**7. Enable services**
```bash
sudo systemctl enable --now NetworkManager
sudo systemctl enable --now bluetooth
```

Reboot and you're good to go.

</details>

<a id="future-plans"></a>
## <img src="https://readme-typing-svg.herokuapp.com?font=Fira+Code&size=36&pause=50&color=DCFFC2&center=false&vCenter=true&width=500&lines=Future+Plans" />

- [ ] Add color scheme integration (pywal/matugen)
- [ ] Add additional themes with a theme selector (rofi)

<a id="packages"></a>
## <img src="https://readme-typing-svg.herokuapp.com?font=Fira+Code&size=36&pause=50&color=DCFFC2&center=false&vCenter=true&width=500&lines=Packages" />

- **Window Manager:** Hyprland  
- **Bar:** Waybar 
- **Terminal:** Foot
- **Launcher:** Rofi
- **Shell:** Fish - omf
- **Notifications:** swaync
- **Extras:** playerctl, brightnessctl, grim/slurp (screenshots), nwg-look  

Managed with GNUstow

<b id="Inspriration"></b>
## <img src="https://readme-typing-svg.herokuapp.com?font=Fira+Code&size=18&pause=50&color=DCFFC2&center=false&vCenter=true&width=500&lines=Inspiration" />

- https://github.com/mylinuxforwork/dotfiles
- https://github.com/end-4/dots-hyprland?tab=readme-ov-file
- **And many more...**
