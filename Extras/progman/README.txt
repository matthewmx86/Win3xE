This script uses pcmanfm to display a Program Manager window with application categories and shortcuts like the 
Program Manager on Windows 3.1. It creates a separate pcmanfm profile for the script, if you currently use pcmanfm as your default
file manager the profile won't affect your current pcmanfm settings. 

1. Install pcmanfm. (Required)

2. After pcmanfm is installed you will want to disable the notifcation for executable files. Open pcmanfm and goto 
   Edit > Preferences. Select "Don't ask options on launch executable file", otherwise you will get a confirmation everytime
   you launch an application from the Program Manager window.

3. (Optional) Install wmctrl if you would like the progman script to focus the Program Manager window if it is already running.
   This is useful if you would like to focus the Program Manager window if it is already running and it is hidden / minimized.
   Just set a hotkey to execute 'progman' and the script will focus the Program Manager window when the hotkey is pressed. 
 
3. Run the command "chmod +x ./install.sh" to mark the install script executable otherwise you might recieve the error permission denied. 

4. Extract the prog_man.tar.gz archive and cd into the directory.

4. Run "./install.sh" as root or run "sudo ./install.sh" as a user with sudo permissions.
   This will copy the scripts into the /usr/local/progman directory and create a symlink in /usr/bin to launch the progman script. 

5. Run "progman" from a console to initialize you local settings. Press "y" and hit enter when it asks if you would like to initialize your setup now.
   This will create and attempt to populate the Program Manager directories with shortcuts to your install applications. 

6. Run "progman" from a console or your DE's run dialog. This will open the Program Manager window.

7. (optional) You can also setup your Desktop Environment to autostart "progman" on startup.