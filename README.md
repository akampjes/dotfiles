# How it works

Config files are stored, in the `files/` directory. They may be nested within
other directories or even hidden files, all of which will be created/symlinked
over.

# Running

Need ruby installed, and then
`ruby install.rb`

# Setting up i3 + gnome

```shell
sudo pacman -S adobe-source-code-pro-fonts conky rofi i3-gaps dmenu i3 picom i3blocks sensors-applet gnome-applets gnome-flashback
```

```shell
yay -S st i3-gnome-flashback
```

Gnome settings which need setting:

```shell
gsettings set org.gnome.gnome-flashback desktop false
gsettings set org.gnome.gnome-flashback root-background true

# Remap default keyboard switch keybindings to avoid collision w/ i3
gsettings set org.gnome.desktop.wm.keybindings switch-input-source "['<Alt><Super>BackSpace']"
gsettings set org.gnome.desktop.wm.keybindings switch-input-source-backward "['<Shift><Alt><Super>BackSpace']"
```
