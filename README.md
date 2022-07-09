# Win3xE
<h3>A GTK2/3 Windows 3.1 theme.</h3>
[Work in progress]
This is a project to emulate the Windows 3.1 look and feel. Color scheme is from the Windows 3.1 theme called "Arizona".
Window manager theme is for xfce4/xfwm4. It is currently designed to be used with gtk-nocsd, CSD window theming
is currently incomplete just a basic color titlebar. Also included is a basic script for emulating the "program manager".
You will need to install the pcmanfm file manager to use the progman script.

<h4>To install theme:</h4>
Copy the Win3xE_Arizona into your ~/.themes directory or /usr/share/themes for multi user installs.
Select Win3xE Arizona from xfce appearance settings.
Select Win3xE Arizona from xfce window manager settings.

<h4>To install progman script:</h4>
-Install pcmanfm and wmctrl using your distros package manager.
-Run "./install.sh" from the Extras/progman directory to install.
-After installing progman run "progman -i" to create initial config.
-Run "progman -s" to populate the icons.
-Run "progman" to start

Tip: Set a hot key to run progman, it will restore the progman window to the current desktop.
