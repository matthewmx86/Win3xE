#!/bin/bash
exists=0
working_dir=~/.progman
applications=/usr/share/applications
wmctrl_exe=/usr/bin/wmctrl

function initialize {
mkdir $working_dir
mkdir $working_dir/Accessories
mkdir $working_dir/Development
mkdir $working_dir/Games
mkdir $working_dir/Internet
mkdir $working_dir/Office
mkdir $working_dir/Settings
mkdir $working_dir/Multimedia
mkdir $working_dir/System
cd $working_dir

if [ -e ~/.config/pcmanfm ]; then
	echo ""
else
	mkdir ~/.config/pcmanfm
fi
if [ -e ~/.config/pcmanfm/progman ]; then
	echo ""
else
	mkdir ~/.config/pcmanfm/progman
fi
cp -v /usr/local/progman/progman.tar.gz $working_dir/
tar -xvzf progman.tar.gz
rm progman.tar.gz
echo "Creating progman pcmanfm profile in ~/.config/pcmanfm/progman"
mv pcmanfm.conf ~/.config/pcmanfm/progman/pcmanfm.conf
cd $working_dir
echo "Icon=$(pwd)/folder.png" >> $working_dir"/Program Manager/Accessories.desktop"
echo "Icon=$(pwd)/folder.png" >> $working_dir"/Program Manager/Development.desktop"
echo "Icon=$(pwd)/folder.png" >> $working_dir"/Program Manager/Games.desktop"
echo "Icon=$(pwd)/folder.png" >> $working_dir"/Program Manager/Multimedia.desktop"
echo "Icon=$(pwd)/folder.png" >> $working_dir"/Program Manager/Office.desktop"
echo "Icon=$(pwd)/folder.png" >> $working_dir"/Program Manager/Settings.desktop"
echo "Icon=$(pwd)/folder.png" >> $working_dir"/Program Manager/System.desktop"
echo "Icon=$(pwd)/internet.png" >> $working_dir"/Program Manager/Internet.desktop"
chmod +x $working_dir/"Program Manager/"*
echo "Initialization complete. You may now populate directories with application shortcuts."
echo "Directoriess are located in $working_dir"
}

function scan {
if [ -e $working_dir/"Program Manager" ]; then
cd $applications
clear
echo "Please wait, scanning for application icons this may take some time..."
for i in $( ls ); do
  category=$(cat $i | grep -o "Categories=".*)
  if [ $(echo $category | grep -c "Utility") -gt 0 ]; then
    cp -uv $i $working_dir/Accessories/
    chmod +x $working_dir/Accessories/$i
  fi
  if [ $(echo $category | grep -c "Graphics") -gt 0 ]; then
    cp -uv $i $working_dir/Accessories/
    chmod +x $working_dir/Accessories/$i
  fi
  if [ $(echo $category | grep -c "AudioVideo") -gt 0 ]; then
    cp -uv $i $working_dir/Multimedia/
    chmod +x $working_dir/Multimedia/$i
  fi

  if [ $(echo $category | grep -c "System") -gt 0 ]; then
    cp -uv $i $working_dir/System/
    chmod +x $working_dir/System/$i
  fi
  if [ $(echo $category | grep -c "Development") -gt 0 ]; then
    cp -uv $i $working_dir/Development/
    chmod +x $working_dir/Development/$i
  fi
  if [ $(echo $category | grep -c "Game") -gt 0 ]; then
    cp -uv $i $working_dir/Games/
    chmod +x $working_dir/Games/$i
  fi
  if [ $(echo $category | grep -c "Network") -gt 0 ]; then
    cp -uv $i $working_dir/Internet/
    chmod +x $working_dir/Internet/$i
  fi
  if [ $(echo $category | grep -c "Office") -gt 0 ]; then
    cp -uv $i $working_dir/Office/
    chmod +x $working_dir/Office/$i
  fi

  if [ $(echo $category | grep -c "Settings") -gt 0 ]; then
    cp -uv $i $working_dir/Settings/
    chmod +x $working_dir/Settings/$i
  fi
done
echo "Scan complete."

else
echo "The local user installation has not been initialized in $working_dir. Please run 'progman -i' to initialize before scanning for application shortcuts."
echo "Exiting..."
exit
fi
}

function focus {
	for i in $(ls ~/.progman | grep  [A-Z].*[a-z]); do
		wmctrl -Fa $i
	done
        wmctrl -Fa "Program Manager"
}

if [ "$1" = "-i" ]; then
	initialize
	exit
fi

if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
	echo "Program Manager script. Scans for application shortcuts and creates a "Program Manager" directory structure with application shortcuts similiar to Windows Progman Manager as featured in Windows 3.0. Pcmanfm is used to browse the shortcuts due to its ability to be highly customized. Note: This script creates a custom profile for progman so your default profile will be untouched and still useable. Please back up your pcmanfm settings"
	echo ""
	echo "The following options are available:"
	echo ""
	echo "-i   Initialize local user installation."
	echo "-s   Scans for application icons in /usr/share/applications"
	echo "     Can also be used to scan for any new icons after an installation."
	echo "-r   Removes all user Program Manager settings and shortcuts."
	exit
fi

if [ "$1" = "-s" ]; then
	scan
	exit
fi

if [ "$1" = "-r" ]; then
	clear
	echo "Are you sure you want to remove all user data in $working_dir? (y/n)"
	read confirm
	if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
		rm -rf $working_dir
		rm -rf ~/.config/pcmanfm/progman
		clear
		echo "$(pwd)/.progman directory removed."
		echo "~/.config/pcmanfm/progman directory removed."
		exit
	else
		echo "User selected no. No changes were made."
		exit
	fi
else
	if [ -e ~/.progman ]; then
		exists=1
	fi
	if [ $exists != 1 ]; then
		clear
		echo "It looks like this is the first time you have run the Program Manager script. You will need to initialize the local user installation first. Would you like to initialize and populate the directories with shortcuts now? (y/n) "
		read response
			if [ "$response" = "y" ] || [ "$response" = "Y" ]; then
			initialize
			scan
			clear
			echo "Initialization complete. Application shortcuts are located in $working_dir/Category directories."
			echo "You may add or remove icons in these directories as you see fit. To remove all shortcuts you can run 'progman -r'."
			echo "You can scan for new shortcuts anytime by running 'progman -s'. You may now start the program manager by running 'progman'."
			echo "If you have wmctrl installed the progman script will focus the Program Manager window if it is already active."
			exit
		else
			clear
			echo "User selected no or an invalid response was selected. Initialization canceled."
			echo "To use the Program Manager script you will need to initialize your local directories first."
			echo "Local settings are stored in $working_dir. To initialize run 'progman -i'."
			echo "Now exiting..."
			exit
		fi
	fi

fi

if [ -e $wmctrl_exe ] && [ $(ps -ux | grep -c /usr/bin/progman) -gt 3 ]; then
	focus
else
	pcmanfm --profile=progman ~/.progman/"Program Manager"
fi
