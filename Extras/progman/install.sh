#!/bin/bash
clear
echo "This script will install the program manager scripts to your system. The script files are stored in /usr/local/progman."
echo "Do you wish to continue with the installation? (y/n)"
read response
if [ "$response" = "y" ] || [ "$response" = "Y" ]; then
	echo "Continuing with installation..."
else
	echo "User selected no or an invalid response was entered. No changes have been made."
	echo "Exiting..."
	exit
fi

if [ -e /usr/local/progman ]; then
	echo "Directory alreay exists."
else
	echo "Creating directory '/usr/local/progman'".
	mkdir /usr/local/progman
	if [ -e /usr/local/progman ]; then
		echo "Success."
	else
		echo "Error: Unable to create directory. Make sure you are root or have write permissions."
		echo "Exiting..."
		exit
	fi
fi
echo "Now copying files to '/usr/local/progman'"
cp -v progman.tar.gz /usr/local/progman/
cp -v progman.sh /usr/local/progman/
if [ -e /usr/local/progman/progman.tar.gz ] && [ -e /usr/local/progman/progman.sh ]; then
	chmod +x /usr/local/progman/progman.sh
	echo "Success."
else
	echo "Error: Unable to copy files to /usr/local/progman. Make sure you are ruuning the script as root or using sudo."
	echo "Exiting..."
	exit
fi
echo "Creating symlink to progman.sh"
if [ -e /usr/bin/progman ]; then
	echo "Warning: file /usr/bin/progman exists. Copying backup to ~/progman.bak"
	cp /usr/bin/progman ~/progman.bak
	echo "Removing /usr/bin/progman ..."
	rm /usr/bin/progman
	echo "Creating symlink..."
	ln -sf /usr/local/progman/progman.sh /usr/bin/progman
	if [ -e /usr/bin/progman ]; then
		chmod +x /usr/bin/progman
        	echo "Complete."
        else
		echo "Error: Unable to create symlink to /usr/local/progman/progman.sh. Check that the file exists and you have write permissions."
		echo "Exiting..."
		exit
	fi
else
	echo "Creating symlink..."
	ln -sf /usr/local/progman/progman.sh /usr/bin/progman
		if [ -e /usr/bin/progman ]; then
			echo "Complete."
			echo "Installation complete. You may now run the command 'progman' to start the Program Manager"
			echo "Please run the script from a console on the first run to initialize your application shortcuts."
		else
			echo "Error: Unable to create symlink to /usr/local/progman/progman.sh. Check that the file exists and you have write permissions."
			exit
		fi
fi

exit
