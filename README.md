# Win3xE
<h3>A GTK2/3 Windows 3.1 theme.</h3>


![Image Screenshot](https://github.com/matthewmx86/Win3xE/blob/main/Screenshots/netscape1.png)

[Work in progress]
This is a project to emulate the Windows 3.1 look and feel. Color scheme is from the Windows 3.1 theme called "Arizona".
Window manager theme is for xfce4/xfwm4. It is currently designed to be used with gtk-nocsd, CSD window theming
is currently incomplete just a basic color titlebar. Also included is a basic script for emulating the "program manager".
You will need to install the pcmanfm file manager to use the progman script.

<h4>To install theme:</h4>
Copy the Win3xE_Arizona folder into your ~/.themes/ directory or /usr/share/themes/ for multi user installs.<br>
Select Win3xE Arizona from xfce appearance settings.<br>
Select Win3xE Arizona from xfce window manager settings.<br>

<h4>To install progman script:</h4>
-Install pcmanfm and wmctrl using your distros package manager.<br>
-Run "./install.sh" from the Extras/progman directory to install.<br>
-After installing progman run "progman -i" to create initial config.<br>
-Run "progman -s" to populate the icons.<br>
-Run "progman" to start<br><br>
Tip: Set a hot key to run progman, it will restore the progman window to the current desktop/screen when the hot key is pushed. (Requires wmctrl, current assumes Xorg I'm not sure on wayland...)

<h4>More info:</h4>
Check out the gtk-nocsd project to disable csd windows. The project hasn't been updated in some time however it is functional as of now. https://github.com/PCMan/gtk3-nocsd<br>
Check out my Netscape theme for Firefox to get the Netscape look to go along with your Win3xE desktop:<br>https://github.com/matthewmx86/RetroThemesFirefox<br>
Use the Netscape4_alt theme for best results.

<h4>Screenshots</h4>
![Image Screenshot](https://github.com/matthewmx86/Win3xE/blob/main/Screenshots/win1.png)
![Image Screenshot](https://github.com/matthewmx86/Win3xE/blob/main/Screenshots/win2.png)

