#!/bin/bash
clear

UPDATE_DATE="05052021"
LOG_FILE="/home/ark/update$UPDATE_DATE.log"
UPDATE_DONE="/home/ark/.config/.update$UPDATE_DATE"

if [ -f "$UPDATE_DONE" ]; then
	LD_LIBRARY_PATH=/usr/local/bin msgbox "No more updates available.  Check back later."
	rm -- "$0"
	exit 187
fi

if [ -f "$LOG_FILE" ]; then
	sudo rm "$LOG_FILE"
fi

c_brightness="$(cat /sys/devices/platform/backlight/backlight/backlight/brightness)"
sudo chmod 666 /dev/tty1
echo 255 > /sys/devices/platform/backlight/backlight/backlight/brightness
touch $LOG_FILE
tail -f $LOG_FILE >> /dev/tty1 &

if [ ! -f "/home/ark/.config/.update04112021" ]; then

	printf "\nChange kernel and dtb\nUpdate ogage\nUpdate perfmax to not remove .asoundrc\nUpdate dreamcast.sh atomiswave.sh naomi.sh openborkeydemon.py ppssppkeydemon.py solarushotkeydemon.py pico8keydemon.py ti99keydemon.py\nUpdated Switch to SD2 for Roms.sh and Switch to main SD for Roms.sh\nRemove rg351_gpio.sh from crontab" | tee -a "$LOG_FILE"
	sudo wget -t 3 -T 60 --no-check-certificate http://gitcdn.link/cdn/christianhaitian/arkos/main/04112021/rg351v/arkosupdate04112021.zip -O /home/ark/arkosupdate04112021.zip -a "$LOG_FILE" || rm -f /home/ark/arkosupdate04112021.zip | tee -a "$LOG_FILE"
	if [ -f "/home/ark/arkosupdate04112021.zip" ]; then
		sudo unzip -X -o /home/ark/arkosupdate04112021.zip -d / | tee -a "$LOG_FILE"
		sudo depmod 4.4.189
		sudo rm -v /home/ark/arkosupdate04112021.zip | tee -a "$LOG_FILE"
	else 
		printf "\nThe update couldn't complete because the package did not download correctly.\nPlease retry the update again." | tee -a "$LOG_FILE"
		sleep 3
		echo $c_brightness > /sys/devices/platform/backlight/backlight/backlight/brightness
		exit 1
	fi

	printf "\nUpdate boot text to reflect current version of ArkOS\n" | tee -a "$LOG_FILE"
	sudo sed -i "/title\=/c\title\=ArkOS OaD (Test Release 1.1)" /usr/share/plymouth/themes/text.plymouth

	touch "/home/ark/.config/.update04112021"
fi

if [ ! -f "/home/ark/.config/.update04132021" ]; then

	printf "\nUpdate wifi.sh network info.sh change password.sh to fix no controls from last kernel change\nFix potential Daphne, TI99, and SCUMMVM not launching issue\nFixed PPSSPP reversed analog menu controls\n" | tee -a "$LOG_FILE"
	sudo wget -t 3 -T 60 --no-check-certificate http://gitcdn.link/cdn/christianhaitian/arkos/main/04132021/rg351v/arkosupdate04132021.zip -O /home/ark/arkosupdate04132021.zip -a "$LOG_FILE" || rm -f /home/ark/arkosupdate04132021.zip | tee -a "$LOG_FILE"
	if [ -f "/home/ark/arkosupdate04132021.zip" ]; then
		sudo unzip -X -o /home/ark/arkosupdate04132021.zip -d / | tee -a "$LOG_FILE"
		sudo rm -v /home/ark/arkosupdate04132021.zip | tee -a "$LOG_FILE"
	    if [ -f "/opt/system/Advanced/Switch to main SD for Roms.sh" ]; then
		  sudo cp -f -v "/usr/local/bin/Switch to main SD for Roms.sh" "/opt/system/Advanced/Switch to main SD for Roms.sh" | tee -a "$LOG_FILE"
		else
		  sudo cp -f -v "/usr/local/bin/Switch to SD2 for Roms.sh" "/opt/system/Advanced/Switch to SD2 for Roms.sh" | tee -a "$LOG_FILE"
		fi
	else 
		printf "\nThe update couldn't complete because the package did not download correctly.\nPlease retry the update again." | tee -a "$LOG_FILE"
		sleep 3
		echo $c_brightness > /sys/devices/platform/backlight/backlight/backlight/brightness
		exit 1
	fi

	printf "\nUpdate boot text to reflect current version of ArkOS\n" | tee -a "$LOG_FILE"
	sudo sed -i "/title\=/c\title\=ArkOS OaD (Test Release 1.2)" /usr/share/plymouth/themes/text.plymouth

	touch "/home/ark/.config/.update04132021"
fi

if [ ! -f "/home/ark/.config/.update04152021" ]; then

	printf "\nUpdate scummvm to fix AGS not loading\nUpdate perfmax and perfnorm scripts to fix screen flashing issue on loading and returning from games.\nUpdate Emulationstation to not use Batocera's scraping ID\n" | tee -a "$LOG_FILE"
	sudo wget -t 3 -T 60 --no-check-certificate http://gitcdn.link/cdn/christianhaitian/arkos/main/04152021/rg351v/arkosupdate04152021.zip -O /home/ark/arkosupdate04152021.zip -a "$LOG_FILE" || rm -f /home/ark/arkosupdate04152021.zip | tee -a "$LOG_FILE"
	if [ -f "/home/ark/arkosupdate04152021.zip" ]; then
		sudo unzip -X -o /home/ark/arkosupdate04152021.zip -d / | tee -a "$LOG_FILE"
		sudo rm -v /home/ark/arkosupdate04152021.zip | tee -a "$LOG_FILE"
	else 
		printf "\nThe update couldn't complete because the package did not download correctly.\nPlease retry the update again." | tee -a "$LOG_FILE"
		sleep 3
		echo $c_brightness > /sys/devices/platform/backlight/backlight/backlight/brightness
		exit 1
	fi

	printf "\nUpdate boot text to reflect current version of ArkOS\n" | tee -a "$LOG_FILE"
	sudo sed -i "/title\=/c\title\=ArkOS OaD (Test Release 1.3)" /usr/share/plymouth/themes/text.plymouth

	touch "/home/ark/.config/.update04152021"
fi

if [ ! -f "/home/ark/.config/.update04162021" ]; then

	printf "\nUpdate to add support for launching retrorun Dreamcast in 640 mode by holding A\nFix no controls for retrorun saturn\nUpdated libgo2.so libs\nUpdate Enable Remote Services script to show assigned IP and 5s pause\n" | tee -a "$LOG_FILE"
	sudo wget -t 3 -T 60 --no-check-certificate http://gitcdn.link/cdn/christianhaitian/arkos/main/04162021/rg351v/arkosupdate04162021.zip -O /home/ark/arkosupdate04162021.zip -a "$LOG_FILE" || rm -f /home/ark/arkosupdate04162021.zip | tee -a "$LOG_FILE"
	if [ -f "/home/ark/arkosupdate04162021.zip" ]; then
		sudo unzip -X -o /home/ark/arkosupdate04162021.zip -d / | tee -a "$LOG_FILE"
        if [ ! -f "/opt/system/Advanced/Switch to main SD for Roms.sh" ]; then
           sudo sed -i '/roms2\//s//roms\//g' /usr/local/bin/dreamcast.sh
		fi
		sudo rm -v /home/ark/arkosupdate04162021.zip | tee -a "$LOG_FILE"
	else 
		printf "\nThe update couldn't complete because the package did not download correctly.\nPlease retry the update again." | tee -a "$LOG_FILE"
		sleep 3
		echo $c_brightness > /sys/devices/platform/backlight/backlight/backlight/brightness
		exit 1
	fi

	printf "\nUpdate boot text to reflect current version of ArkOS\n" | tee -a "$LOG_FILE"
	sudo sed -i "/title\=/c\title\=ArkOS OaD (Test Release 1.4)" /usr/share/plymouth/themes/text.plymouth

	touch "/home/ark/.config/.update04162021"
fi

if [ ! -f "/home/ark/.config/.update04172021" ]; then

	printf "\nFix issue with being able to consistently launch dreamcast in 640x480\n" | tee -a "$LOG_FILE"
	sudo sed -i '/#!\/bin\/bash/s//#!\/bin\/bash\n\nsudo chmod 666 \/dev\/tty1/' /usr/local/bin/dreamcast.sh
	
	printf "\nUpdate boot text to reflect current version of ArkOS\n" | tee -a "$LOG_FILE"
	sudo sed -i "/title\=/c\title\=ArkOS OaD (Test Release 1.5)" /usr/share/plymouth/themes/text.plymouth

	touch "/home/ark/.config/.update04172021"
fi

if [ ! -f "/home/ark/.config/.update04172021-1" ]; then

	printf "\nUpdate to add brightness control using F+Vol Up+Dn buttons for better gradual control\n" | tee -a "$LOG_FILE"
	sudo wget -t 3 -T 60 --no-check-certificate http://gitcdn.link/cdn/christianhaitian/arkos/main/04172021-1/rg351v/arkosupdate04172021-1.zip -O /home/ark/arkosupdate04172021-1.zip -a "$LOG_FILE" || rm -f /home/ark/arkosupdate04172021-1.zip | tee -a "$LOG_FILE"
	if [ -f "/home/ark/arkosupdate04172021-1.zip" ]; then
		sudo unzip -X -o /home/ark/arkosupdate04172021-1.zip -d / | tee -a "$LOG_FILE"
		sudo systemctl enable oga_events
		sudo systemctl restart oga_events
		sudo rm -v /home/ark/arkosupdate04172021-1.zip | tee -a "$LOG_FILE"
	else 
		printf "\nThe update couldn't complete because the package did not download correctly.\nPlease retry the update again." | tee -a "$LOG_FILE"
		sleep 3
		echo $c_brightness > /sys/devices/platform/backlight/backlight/backlight/brightness
		exit 1
	fi
	
	printf "\nUpdate boot text to reflect current version of ArkOS\n" | tee -a "$LOG_FILE"
	sudo sed -i "/title\=/c\title\=ArkOS OaD (Test Release 1.5.1)" /usr/share/plymouth/themes/text.plymouth

	touch "/home/ark/.config/.update04172021-1"
fi

if [ ! -f "/home/ark/.config/.update04182021" ]; then

	printf "\nUpdate to add missing dreamcast.sh script\nAdd Video Player\n" | tee -a "$LOG_FILE"
	sudo wget -t 3 -T 60 --no-check-certificate http://gitcdn.link/cdn/christianhaitian/arkos/main/04182021/rg351v/arkosupdate04182021.zip -O /home/ark/arkosupdate04182021.zip -a "$LOG_FILE" || rm -f /home/ark/arkosupdate04182021.zip | tee -a "$LOG_FILE"
	if [ -f "/home/ark/arkosupdate04182021.zip" ]; then
		sudo unzip -X -o /home/ark/arkosupdate04182021.zip -d / | tee -a "$LOG_FILE"
		sudo apt update -y && sudo apt -y install ffmpeg | tee -a "$LOG_FILE"
		if [ ! -d "/roms/videos/" ]; then
			sudo mkdir -v /roms/videos | tee -a "$LOG_FILE"
		fi
		if [ "$(ls -A /roms2)" ]; then
			sudo mkdir -v /roms2/videos | tee -a "$LOG_FILE"
		fi
		sudo cp -v /etc/emulationstation/es_systems.cfg /etc/emulationstation/es_systems.cfg.update04182021.bak | tee -a "$LOG_FILE"
		sudo sed -i -e '/<theme>uzebox<\/theme>/{r /home/ark/add_videos.txt' -e 'd}' /etc/emulationstation/es_systems.cfg
		if [ -f "/opt/system/Advanced/Switch to main SD for Roms.sh" ]; then
		  sed -i '/<path>\/roms\//s//<path>\/roms2\//' /etc/emulationstation/es_systems.cfg
		fi
		sudo rm -v /home/ark/add_videos.txt | tee -a "$LOG_FILE"
		sudo rm -v /home/ark/arkosupdate04182021.zip | tee -a "$LOG_FILE"
	else 
		printf "\nThe update couldn't complete because the package did not download correctly.\nPlease retry the update again." | tee -a "$LOG_FILE"
		sleep 3
		echo $c_brightness > /sys/devices/platform/backlight/backlight/backlight/brightness
		exit 1
	fi

	printf "\nMake sure the proper SDLs are still linked\n" | tee -a "$LOG_FILE"
	sudo ln -sfv /usr/lib/aarch64-linux-gnu/libSDL2-2.0.so.0.10.0 /usr/lib/aarch64-linux-gnu/libSDL2-2.0.so.0 | tee -a "$LOG_FILE"
	sudo ln -sfv /usr/lib/arm-linux-gnueabihf/libSDL2-2.0.so.0.10.0 /usr/lib/arm-linux-gnueabihf/libSDL2-2.0.so.0 | tee -a "$LOG_FILE"
	
	printf "\nUpdate boot text to reflect current version of ArkOS\n" | tee -a "$LOG_FILE"
	sudo sed -i "/title\=/c\title\=ArkOS OaD (Test Release 1.6)" /usr/share/plymouth/themes/text.plymouth

	touch "/home/ark/.config/.update04182021"
fi

if [ ! -f "/home/ark/.config/.update04222021" ]; then

	printf "\nAdd UAE4arm for Amiga and Amiga32\nAdd potator core for Watara Supervision\nAdd Megadrive MSU\nFixed switch to main and switch to sd2 scripts\nFix Daphne not loading from SD2\n" | tee -a "$LOG_FILE"
	sudo wget -t 3 -T 60 --no-check-certificate http://gitcdn.link/cdn/christianhaitian/arkos/main/04222021/rg351v/arkosupdate04222021.zip -O /home/ark/arkosupdate04222021.zip -a "$LOG_FILE" || rm -f /home/ark/arkosupdate04222021.zip | tee -a "$LOG_FILE"
	if [ -f "/home/ark/arkosupdate04222021.zip" ]; then
		sudo cp -v /etc/emulationstation/es_systems.cfg /etc/emulationstation/es_systems.cfg.update04182021.bak | tee -a "$LOG_FILE"
		sudo unzip -X -o /home/ark/arkosupdate04222021.zip -d / | tee -a "$LOG_FILE"
		if [ ! -d "/roms/supervision/" ]; then
			sudo mkdir -v /roms/supervision | tee -a "$LOG_FILE"
		fi
		if [ "$(ls -A /roms2)" ]; then
			sudo mkdir -v /roms2/supervision | tee -a "$LOG_FILE"
		fi
		if [ ! -d "/roms/msumd/" ]; then
			sudo mkdir -v /roms/msumd | tee -a "$LOG_FILE"
		fi
		if [ "$(ls -A /roms2)" ]; then
			sudo mkdir -v /roms2/msumd | tee -a "$LOG_FILE"
		fi
	    if [ ! -f "/opt/system/Advanced/Switch to main SD for Roms.sh" ]; then
		  sed -i '/<path>\/roms2\//s//<path>\/roms\//' /etc/emulationstation/es_systems.cfg
		fi
	    if [ -f "/opt/system/Advanced/Switch to main SD for Roms.sh" ]; then
		  sudo cp -f -v "/usr/local/bin/Switch to main SD for Roms.sh" "/opt/system/Advanced/Switch to main SD for Roms.sh" | tee -a "$LOG_FILE"
		else
		  sudo cp -f -v "/usr/local/bin/Switch to SD2 for Roms.sh" "/opt/system/Advanced/Switch to SD2 for Roms.sh" | tee -a "$LOG_FILE"
		fi
		sudo rm -v /home/ark/arkosupdate04222021.zip | tee -a "$LOG_FILE"
	else 
		printf "\nThe update couldn't complete because the package did not download correctly.\nPlease retry the update again." | tee -a "$LOG_FILE"
		sleep 3
		echo $c_brightness > /sys/devices/platform/backlight/backlight/backlight/brightness
		exit 1
	fi

	printf "\nMake sure the proper SDLs are still linked\n" | tee -a "$LOG_FILE"
	sudo ln -sfv /usr/lib/aarch64-linux-gnu/libSDL2-2.0.so.0.10.0 /usr/lib/aarch64-linux-gnu/libSDL2-2.0.so.0 | tee -a "$LOG_FILE"
	sudo ln -sfv /usr/lib/arm-linux-gnueabihf/libSDL2-2.0.so.0.10.0 /usr/lib/arm-linux-gnueabihf/libSDL2-2.0.so.0 | tee -a "$LOG_FILE"
	
	printf "\nUpdate boot text to reflect current version of ArkOS\n" | tee -a "$LOG_FILE"
	sudo sed -i "/title\=/c\title\=ArkOS OaD (Test Release 1.7)" /usr/share/plymouth/themes/text.plymouth

	touch "/home/ark/.config/.update04222021"
fi

if [ ! -f "/home/ark/.config/.update04232021" ]; then

	printf "\nAdded ppsspp-stock emulator as default\nAdded ability to restore retroarch and retroarch32 default settings\n" | tee -a "$LOG_FILE"
	sudo wget -t 3 -T 60 --no-check-certificate http://gitcdn.link/cdn/christianhaitian/arkos/main/04232021/rg351v/arkosupdate04232021.zip -O /home/ark/arkosupdate04232021.zip -a "$LOG_FILE" || rm -f /home/ark/arkosupdate04232021.zip | tee -a "$LOG_FILE"
	if [ -f "/home/ark/arkosupdate04232021.zip" ]; then
		sudo cp -v /etc/emulationstation/es_systems.cfg /etc/emulationstation/es_systems.cfg.update04232021.bak | tee -a "$LOG_FILE"
		sudo unzip -X -o /home/ark/arkosupdate04232021.zip -d / | tee -a "$LOG_FILE"
		sudo rm -v /home/ark/arkosupdate04232021.zip | tee -a "$LOG_FILE"
	else 
		printf "\nThe update couldn't complete because the package did not download correctly.\nPlease retry the update again." | tee -a "$LOG_FILE"
		sleep 3
		echo $c_brightness > /sys/devices/platform/backlight/backlight/backlight/brightness
		exit 1
	fi

	printf "\nMake sure the proper SDLs are still linked\n" | tee -a "$LOG_FILE"
	sudo ln -sfv /usr/lib/aarch64-linux-gnu/libSDL2-2.0.so.0.10.0 /usr/lib/aarch64-linux-gnu/libSDL2-2.0.so.0 | tee -a "$LOG_FILE"
	sudo ln -sfv /usr/lib/arm-linux-gnueabihf/libSDL2-2.0.so.0.10.0 /usr/lib/arm-linux-gnueabihf/libSDL2-2.0.so.0 | tee -a "$LOG_FILE"
	
	printf "\nUpdate boot text to reflect current version of ArkOS\n" | tee -a "$LOG_FILE"
	sudo sed -i "/title\=/c\title\=ArkOS OaD (Test Release 1.8)" /usr/share/plymouth/themes/text.plymouth

	touch "/home/ark/.config/.update04232021"
fi

if [ ! -f "/home/ark/.config/.update04242021" ]; then

	printf "\nForgot to include a check of whether someone is using a second sd card or not and adjust es_systems.cfg accordingly\n" | tee -a "$LOG_FILE"
	if [ ! -f "/opt/system/Advanced/Switch to main SD for Roms.sh" ]; then
	  sed -i '/<path>\/roms2\//s//<path>\/roms\//' /etc/emulationstation/es_systems.cfg
	fi
	
	printf "\nUpdate boot text to reflect current version of ArkOS\n" | tee -a "$LOG_FILE"
	sudo sed -i "/title\=/c\title\=ArkOS OaD (Test Release 1.8.1)" /usr/share/plymouth/themes/text.plymouth

	touch "/home/ark/.config/.update04242021"
fi

if [ ! -f "/home/ark/.config/.update04242021-1" ]; then

	printf "\nAdd ability to toggle wifi via F+L3\n" | tee -a "$LOG_FILE"
	sudo wget -t 3 -T 60 --no-check-certificate http://gitcdn.link/cdn/christianhaitian/arkos/main/04242021-1/rg351v/arkosupdate04242021-1.zip -O /home/ark/arkosupdate04242021-1.zip -a "$LOG_FILE" || rm -f /home/ark/arkosupdate04242021-1.zip | tee -a "$LOG_FILE"
	if [ -f "/home/ark/arkosupdate04242021-1.zip" ]; then
		sudo unzip -X -o /home/ark/arkosupdate04242021-1.zip -d / | tee -a "$LOG_FILE"
		sudo rm -v /home/ark/arkosupdate04242021-1.zip | tee -a "$LOG_FILE"
	else 
		printf "\nThe update couldn't complete because the package did not download correctly.\nPlease retry the update again." | tee -a "$LOG_FILE"
		sleep 3
		echo $c_brightness > /sys/devices/platform/backlight/backlight/backlight/brightness
		exit 1
	fi
	
	printf "\nUpdate boot text to reflect current version of ArkOS\n" | tee -a "$LOG_FILE"
	sudo sed -i "/title\=/c\title\=ArkOS OaD (Test Release 1.8.2)" /usr/share/plymouth/themes/text.plymouth

	touch "/home/ark/.config/.update04242021-1"
fi

if [ ! -f "/home/ark/.config/.update04282021" ]; then

	printf "\nImprove stability of global hotkeys\nAdd Fix Global Hotkeys script to /opt/Advanced menu\nRemove some unneeded 32bit sdl2 libraries that cause linker issues\nUpdate retrorun and retrorun32 to hopefully minimize a potential memory leak issue\n" | tee -a "$LOG_FILE"
	sudo wget -t 3 -T 60 --no-check-certificate http://gitcdn.link/cdn/christianhaitian/arkos/main/04282021/rg351v/arkosupdate04282021.zip -O /home/ark/arkosupdate04282021.zip -a "$LOG_FILE" || rm -f /home/ark/arkosupdate04282021.zip | tee -a "$LOG_FILE"
	if [ -f "/home/ark/arkosupdate04282021.zip" ]; then
		sudo systemctl disable oga_events
		sudo unzip -X -o /home/ark/arkosupdate04282021.zip -d / | tee -a "$LOG_FILE"
		sudo systemctl daemon-reload
		sudo systemctl restart oga_events
		sudo systemctl enable oga_events
		sudo rm /usr/lib/arm-linux-gnueabihf/libSDL2-2.0.so.0.12.0
		sudo rm /usr/lib/arm-linux-gnueabihf/libSDL2-2.0.so.0.14.1
		sudo rm -v /home/ark/arkosupdate04282021.zip | tee -a "$LOG_FILE"
	else 
		printf "\nThe update couldn't complete because the package did not download correctly.\nPlease retry the update again." | tee -a "$LOG_FILE"
		sleep 3
		echo $c_brightness > /sys/devices/platform/backlight/backlight/backlight/brightness
		exit 1
	fi

	printf "\nMake sure the proper SDLs are still linked\n" | tee -a "$LOG_FILE"
	sudo ln -sfv /usr/lib/aarch64-linux-gnu/libSDL2-2.0.so.0.10.0 /usr/lib/aarch64-linux-gnu/libSDL2-2.0.so.0 | tee -a "$LOG_FILE"
	sudo ln -sfv /usr/lib/arm-linux-gnueabihf/libSDL2-2.0.so.0.10.0 /usr/lib/arm-linux-gnueabihf/libSDL2-2.0.so.0 | tee -a "$LOG_FILE"
	
	printf "\nUpdate boot text to reflect current version of ArkOS\n" | tee -a "$LOG_FILE"
	sudo sed -i "/title\=/c\title\=ArkOS V (Test Release 1.9)" /usr/share/plymouth/themes/text.plymouth

	touch "/home/ark/.config/.update04282021"
fi

if [ ! -f "/home/ark/.config/.update04302021" ]; then

	printf "\nAdd Change LED color script to Options menu\nUpdate global hotkey app to use absolute path for brightness control\nFix filebrowser to point to right roms folder depending on primary sd in use for roms\n" | tee -a "$LOG_FILE"
	sudo wget -t 3 -T 60 --no-check-certificate http://gitcdn.link/cdn/christianhaitian/arkos/main/04302021/rg351v/arkosupdate04302021.zip -O /home/ark/arkosupdate04302021.zip -a "$LOG_FILE" || rm -f /home/ark/arkosupdate04302021.zip | tee -a "$LOG_FILE"
	if [ -f "/home/ark/arkosupdate04302021.zip" ]; then
		sudo unzip -X -o /home/ark/arkosupdate04302021.zip -d / | tee -a "$LOG_FILE"
	    if [ -f "/opt/system/Advanced/Switch to main SD for Roms.sh" ]; then
		  sudo pkill -e filebrowser | tee -a "$LOG_FILE"
		  filebrowser -d /home/ark/.config/filebrowser.db users update ark --scope "/roms2"
		  sudo cp -f -v "/usr/local/bin/Switch to main SD for Roms.sh" "/opt/system/Advanced/Switch to main SD for Roms.sh" | tee -a "$LOG_FILE"
		else
		  sudo cp -f -v "/usr/local/bin/Switch to SD2 for Roms.sh" "/opt/system/Advanced/Switch to SD2 for Roms.sh" | tee -a "$LOG_FILE"
		fi
		sudo systemctl restart oga_events
		sudo rm -v /home/ark/arkosupdate04302021.zip | tee -a "$LOG_FILE"
	else 
		printf "\nThe update couldn't complete because the package did not download correctly.\nPlease retry the update again." | tee -a "$LOG_FILE"
		sleep 3
		echo $c_brightness > /sys/devices/platform/backlight/backlight/backlight/brightness
		exit 1
	fi

	printf "\nMake sure the proper SDLs are still linked\n" | tee -a "$LOG_FILE"
	sudo ln -sfv /usr/lib/aarch64-linux-gnu/libSDL2-2.0.so.0.10.0 /usr/lib/aarch64-linux-gnu/libSDL2-2.0.so.0 | tee -a "$LOG_FILE"
	sudo ln -sfv /usr/lib/arm-linux-gnueabihf/libSDL2-2.0.so.0.10.0 /usr/lib/arm-linux-gnueabihf/libSDL2-2.0.so.0 | tee -a "$LOG_FILE"
	
	printf "\nUpdate boot text to reflect current version of ArkOS\n" | tee -a "$LOG_FILE"
	sudo sed -i "/title\=/c\title\=ArkOS V (Test Release 1.9.1)" /usr/share/plymouth/themes/text.plymouth

	touch "/home/ark/.config/.update04302021"
fi

if [ ! -f "/home/ark/.config/.update05012021" ]; then

	printf "\nAdd support for Sonic 1, 2, and CD ports\nAdd 2 second sleep to oga_events service to finally stabilize global brightness hotkeys\n" | tee -a "$LOG_FILE"
	sudo wget -t 3 -T 60 --no-check-certificate http://gitcdn.link/cdn/christianhaitian/arkos/main/05012021/rg351v/arkosupdate05012021.zip -O /home/ark/arkosupdate05012021.zip -a "$LOG_FILE" || rm -f /home/ark/arkosupdate05012021.zip | tee -a "$LOG_FILE"
	if [ -f "/home/ark/arkosupdate05012021.zip" ]; then
		sudo unzip -X -o /home/ark/arkosupdate05012021.zip -d / | tee -a "$LOG_FILE"
	    if [ -f "/opt/system/Advanced/Switch to main SD for Roms.sh" ]; then
		  sudo cp -f -v /roms/ports/Sonic\ * /roms2/ports/. | tee -a "$LOG_FILE"
		  sudo cp -f -r -v /roms/ports/sonic* /roms2/ports/ | tee -a "$LOG_FILE"
		  sudo sed -i '/roms\//s//roms2/' /roms2/ports/"Sonic 1.sh"
		  sudo sed -i '/roms\//s//roms2/' /roms2/ports/"Sonic 2.sh"
		  sudo sed -i '/roms\//s//roms2/' /roms2/ports/"Sonic CD.sh"
		else
		  sudo cp -f -v "/usr/local/bin/Switch to SD2 for Roms.sh" "/opt/system/Advanced/Switch to SD2 for Roms.sh" | tee -a "$LOG_FILE"
		fi
		sudo systemctl daemon-reload
		sudo systemctl restart oga_events
		sudo rm -v /home/ark/arkosupdate05012021.zip | tee -a "$LOG_FILE"
	else 
		printf "\nThe update couldn't complete because the package did not download correctly.\nPlease retry the update again." | tee -a "$LOG_FILE"
		sleep 3
		echo $c_brightness > /sys/devices/platform/backlight/backlight/backlight/brightness
		exit 1
	fi

	printf "\nMake sure the proper SDLs are still linked\n" | tee -a "$LOG_FILE"
	sudo ln -sfv /usr/lib/aarch64-linux-gnu/libSDL2-2.0.so.0.10.0 /usr/lib/aarch64-linux-gnu/libSDL2-2.0.so.0 | tee -a "$LOG_FILE"
	sudo ln -sfv /usr/lib/arm-linux-gnueabihf/libSDL2-2.0.so.0.10.0 /usr/lib/arm-linux-gnueabihf/libSDL2-2.0.so.0 | tee -a "$LOG_FILE"
	
	printf "\nUpdate boot text to reflect current version of ArkOS\n" | tee -a "$LOG_FILE"
	sudo sed -i "/title\=/c\title\=ArkOS V (Test Release 2.0)" /usr/share/plymouth/themes/text.plymouth

	touch "/home/ark/.config/.update05012021"
fi

if [ ! -f "/home/ark/.config/.update05012021-1" ]; then

	printf "\nFix ports failing to load from SD2\n" | tee -a "$LOG_FILE"
	sudo wget -t 3 -T 60 --no-check-certificate http://gitcdn.link/cdn/christianhaitian/arkos/main/05012021-1/rg351v/arkosupdate05012021-1.zip -O /home/ark/arkosupdate05012021-1.zip -a "$LOG_FILE" || rm -f /home/ark/arkosupdate05012021-1.zip | tee -a "$LOG_FILE"
	if [ -f "/home/ark/arkosupdate05012021-1.zip" ]; then
		sudo unzip -X -o /home/ark/arkosupdate05012021-1.zip -d / | tee -a "$LOG_FILE"
	    if [ -f "/opt/system/Advanced/Switch to main SD for Roms.sh" ]; then
		  sudo cp -f -r -v /roms/ports/Cannonball.sh /roms2/ports/Cannonball.sh | tee -a "$LOG_FILE"
		  sudo cp -f -r -v /roms/ports/OpenTyrian.sh /roms2/ports/OpenTyrian.sh | tee -a "$LOG_FILE"
		  sudo cp -f -r -v /roms/ports/"Quake 2.sh" /roms2/ports/"Quake 2.sh" | tee -a "$LOG_FILE"
		  sudo cp -f -r -v /roms/ports/Quake.sh /roms2/ports/Quake.sh | tee -a "$LOG_FILE"
		  sudo cp -f -r -v /roms/ports/"Rick Dangerous.sh" /roms2/ports/"Rick Dangerous.sh" | tee -a "$LOG_FILE"
		  sudo cp -f -r -v /roms/ports/SDLPoP.sh /roms2/ports/SDLPoP.sh | tee -a "$LOG_FILE"
		  sudo cp -f -r -v /roms/ports/"Wolfenstein 3D.sh" /roms2/ports/"Wolfenstein 3D.sh" | tee -a "$LOG_FILE"
		  sudo cp -f -v /roms/ports/Sonic\ * /roms2/ports/. | tee -a "$LOG_FILE"
		  sudo sed -i '/roms\//s//roms2\//' /roms2/ports/Cannonball.sh
		  sudo sed -i '/roms\//s//roms2\//' /roms2/ports/"Cave Story.sh"
		  sudo sed -i '/roms\//s//roms2\//' /roms2/ports/OpenTyrian.sh
		  sudo sed -i '/roms\//s//roms2\//' /roms2/ports/"Quake 2.sh"
		  sudo sed -i '/roms\//s//roms2\//' /roms2/ports/Quake.sh
		  sudo sed -i '/roms\//s//roms2\//' /roms2/ports/"Rick Dangerous.sh"
		  sudo sed -i '/roms\//s//roms2\//g' /roms2/ports/SDLPoP.sh
		  sudo sed -i '/roms\//s//roms2\//' /roms2/ports/"Wolfenstein 3D.sh"
		  sudo sed -i '/roms\//s//roms2\//' /roms2/ports/"Sonic 1.sh"
		  sudo sed -i '/roms\//s//roms2\//' /roms2/ports/"Sonic 2.sh"
		  sudo sed -i '/roms\//s//roms2\//' /roms2/ports/"Sonic CD.sh"
		else
		  sudo cp -f -v "/usr/local/bin/Switch to SD2 for Roms.sh" "/opt/system/Advanced/Switch to SD2 for Roms.sh" | tee -a "$LOG_FILE"
		fi
		sudo rm -v /home/ark/arkosupdate05012021-1.zip | tee -a "$LOG_FILE"
	else 
		printf "\nThe update couldn't complete because the package did not download correctly.\nPlease retry the update again." | tee -a "$LOG_FILE"
		sleep 3
		echo $c_brightness > /sys/devices/platform/backlight/backlight/backlight/brightness
		exit 1
	fi

	printf "\nMake sure the proper SDLs are still linked\n" | tee -a "$LOG_FILE"
	sudo ln -sfv /usr/lib/aarch64-linux-gnu/libSDL2-2.0.so.0.10.0 /usr/lib/aarch64-linux-gnu/libSDL2-2.0.so.0 | tee -a "$LOG_FILE"
	sudo ln -sfv /usr/lib/arm-linux-gnueabihf/libSDL2-2.0.so.0.10.0 /usr/lib/arm-linux-gnueabihf/libSDL2-2.0.so.0 | tee -a "$LOG_FILE"
	
	printf "\nUpdate boot text to reflect current version of ArkOS\n" | tee -a "$LOG_FILE"
	sudo sed -i "/title\=/c\title\=ArkOS V (Test Release 2.1)" /usr/share/plymouth/themes/text.plymouth

	touch "/home/ark/.config/.update05012021-1"

fi

if [ ! -f "/home/ark/.config/.update05032021" ]; then

	printf "\nAdd SuperTux\nAdd Mr. Boom\nAdd Dinothawr\nAdd Super Mario War\nAdd CDogs\nFix background music to load from SD2 in ES\nFix roms2 not showing in Samba when using SD2\n" | tee -a "$LOG_FILE"
	sudo wget -t 3 -T 60 --no-check-certificate http://gitcdn.link/cdn/christianhaitian/arkos/main/05032021/rg351v/arkosupdate05032021.zip -O /home/ark/arkosupdate05032021.zip -a "$LOG_FILE" || rm -f /home/ark/arkosupdate05032021.zip | tee -a "$LOG_FILE"
	sudo wget -t 3 -T 60 --no-check-certificate http://gitcdn.link/cdn/christianhaitian/arkos/main/05032021/rg351v/arkosupdate05032021.z01 -O /home/ark/arkosupdate05032021.z01 -a "$LOG_FILE" || rm -f /home/ark/arkosupdate05032021.z01 | tee -a "$LOG_FILE"
	sudo wget -t 3 -T 60 --no-check-certificate http://gitcdn.link/cdn/christianhaitian/arkos/main/05032021/rg351v/arkosupdate05032021.z02 -O /home/ark/arkosupdate05032021.z02 -a "$LOG_FILE" || rm -f /home/ark/arkosupdate05032021.z02 | tee -a "$LOG_FILE"
	sudo wget -t 3 -T 60 --no-check-certificate http://gitcdn.link/cdn/christianhaitian/arkos/master/05032021/rg351v/smwconfig.zip -O /home/ark/smwconfig.zip -a "$LOG_FILE" || rm -f /home/ark/smwconfig.zip | tee -a "$LOG_FILE"
	if [ -f "/home/ark/arkosupdate05032021.zip" ] && [ -f "/home/ark/arkosupdate05032021.z01" ] && [ -f "/home/ark/arkosupdate05032021.z02" ] && [ -f "/home/ark/smwconfig.zip" ]; then
		cd /home/ark/
		sudo apt update -y && sudo apt install -y zip | tee -a "$LOG_FILE"
		sudo zip -F arkosupdate05032021.zip --out arkosupdate.zip | tee -a "$LOG_FILE"
		sudo rm -fv arkosupdate05032021.z* | tee -a "$LOG_FILE"
		sudo unzip -X -o /home/ark/arkosupdate.zip -d / | tee -a "$LOG_FILE"
		sudo unzip -X -o /home/ark/smwconfig.zip -d / | tee -a "$LOG_FILE"
	    if [ -f "/opt/system/Advanced/Switch to main SD for Roms.sh" ]; then
		  sudo cp -f -r -v /roms/ports/Cannonball.sh /roms2/ports/Cannonball.sh | tee -a "$LOG_FILE"
		  sudo cp -f -r -v /roms/ports/OpenTyrian.sh /roms2/ports/OpenTyrian.sh | tee -a "$LOG_FILE"
		  sudo cp -f -r -v /roms/ports/"Quake 2.sh" /roms2/ports/"Quake 2.sh" | tee -a "$LOG_FILE"
		  sudo cp -f -r -v /roms/ports/Quake.sh /roms2/ports/Quake.sh | tee -a "$LOG_FILE"
		  sudo cp -f -r -v /roms/ports/"Rick Dangerous.sh" /roms2/ports/"Rick Dangerous.sh" | tee -a "$LOG_FILE"
		  sudo cp -f -r -v /roms/ports/SDLPoP.sh /roms2/ports/SDLPoP.sh | tee -a "$LOG_FILE"
		  sudo cp -f -r -v /roms/ports/C-Dogs.sh /roms2/ports/C-Dogs.sh | tee -a "$LOG_FILE"
		  sudo cp -f -r -v /roms/ports/dinothawr/ /roms2/ports/ | tee -a "$LOG_FILE"
		  sudo cp -f -r -v /roms/ports/Dinothawr.sh /roms2/ports/Dinothawr.sh | tee -a "$LOG_FILE"
		  sudo cp -f -r -v /roms/ports/"Mr. Boom.sh" /roms2/ports/"Mr. Boom.sh" | tee -a "$LOG_FILE"
		  sudo cp -f -r -v /roms/ports/"Super Mario War.sh" /roms2/ports/"Super Mario War.sh" | tee -a "$LOG_FILE"
		  sudo cp -f -r -v /roms/ports/supertux/ /roms2/ports/ | tee -a "$LOG_FILE"
		  sudo cp -f -r -v /roms/ports/SuperTux.sh /roms2/ports/SuperTux.sh | tee -a "$LOG_FILE"
		  sudo cp -f -r -v /roms/ports/"Wolfenstein 3D.sh" /roms2/ports/"Wolfenstein 3D.sh" | tee -a "$LOG_FILE"
		  sudo cp -f -v /roms/ports/Sonic\ * /roms2/ports/. | tee -a "$LOG_FILE"
		  sudo sed -i '/roms\//s//roms2\//' /roms2/ports/Cannonball.sh
		  sudo sed -i '/roms\//s//roms2\//' /roms2/ports/"Cave Story.sh"
		  sudo sed -i '/roms\//s//roms2\//' /roms2/ports/OpenTyrian.sh
		  sudo sed -i '/roms\//s//roms2\//' /roms2/ports/"Quake 2.sh"
		  sudo sed -i '/roms\//s//roms2\//' /roms2/ports/Quake.sh
		  sudo sed -i '/roms\//s//roms2\//' /roms2/ports/"Rick Dangerous.sh"
		  sudo sed -i '/roms\//s//roms2\//g' /roms2/ports/SDLPoP.sh
		  sudo sed -i '/roms\//s//roms2\//' /roms2/ports/"Wolfenstein 3D.sh"
		  sudo sed -i '/roms\//s//roms2\//' /roms2/ports/"Sonic 1.sh"
		  sudo sed -i '/roms\//s//roms2\//' /roms2/ports/"Sonic 2.sh"
		  sudo sed -i '/roms\//s//roms2\//' /roms2/ports/"Sonic CD.sh"
		  sudo sed -i '/roms\//s//roms2\//' /roms2/ports/"SuperTux.sh"
		  sudo sed -i '/roms\//s//roms2\//' /roms2/ports/"Dinothawr.sh"
		  sudo cp -f /etc/samba/smb.conf.sd2 /etc/samba/smb.conf
		  sudo pkill filebrowser
		  filebrowser -d /home/ark/.config/filebrowser.db users update ark --scope "/roms2"
		  unlink /home/ark/.emulationstation/music
		  ln -sfv /roms2/bgmusic/ /home/ark/.emulationstation/music
		  sudo cp -f -v "/usr/local/bin/Switch to main SD for Roms.sh" "/opt/system/Advanced/Switch to main SD for Roms.sh" | tee -a "$LOG_FILE"
		else
		  sudo cp -f -v "/usr/local/bin/Switch to SD2 for Roms.sh" "/opt/system/Advanced/Switch to SD2 for Roms.sh" | tee -a "$LOG_FILE"
		fi
		sudo rm -v /home/ark/arkosupdate.zip | tee -a "$LOG_FILE"
		sudo rm -v /home/ark/smwconfig.zip | tee -a "$LOG_FILE"
	else 
		printf "\nThe update couldn't complete because the package did not download correctly.\nPlease retry the update again." | tee -a "$LOG_FILE"
		sleep 3
		echo $c_brightness > /sys/devices/platform/backlight/backlight/backlight/brightness
		exit 1
	fi

	printf "Due to the size of this update, synchronizing the data on disk with memory to be sure the update is done right." | tee -a "$LOG_FILE"
	sync
	
	printf "\nMake sure the proper SDLs are still linked\n" | tee -a "$LOG_FILE"
	sudo ln -sfv /usr/lib/aarch64-linux-gnu/libSDL2-2.0.so.0.10.0 /usr/lib/aarch64-linux-gnu/libSDL2-2.0.so.0 | tee -a "$LOG_FILE"
	sudo ln -sfv /usr/lib/arm-linux-gnueabihf/libSDL2-2.0.so.0.10.0 /usr/lib/arm-linux-gnueabihf/libSDL2-2.0.so.0 | tee -a "$LOG_FILE"
	
	printf "\nUpdate boot text to reflect current version of ArkOS\n" | tee -a "$LOG_FILE"
	sudo sed -i "/title\=/c\title\=ArkOS V (Test Release 2.2)" /usr/share/plymouth/themes/text.plymouth

	touch "/home/ark/.config/.update05032021"
fi

if [ ! -f "/home/ark/.config/.update05042021" ]; then

	printf "\nFix Atari800, 5200, and XE loading\nAdd support for EXT4 format for SD2\nIncrease default audio gain for retroarch and retroarch32\nFix default configs for Doom\n" | tee -a "$LOG_FILE"
	sudo wget -t 3 -T 60 --no-check-certificate http://gitcdn.link/cdn/christianhaitian/arkos/main/05042021/rg351v/arkosupdate05042021.zip -O /home/ark/arkosupdate05042021.zip -a "$LOG_FILE" || rm -f /home/ark/arkosupdate05042021.zip | tee -a "$LOG_FILE"
	if [ -f "/home/ark/arkosupdate05042021.zip" ]; then
		cp -f -v /home/ark/.config/lzdoom/lzdoom.ini /home/ark/.config/lzdoom/lzdoom.ini.update05042021.bak | tee -a "$LOG_FILE"
		sudo unzip -X -o /home/ark/arkosupdate05042021.zip -d / | tee -a "$LOG_FILE"
	    if [ -f "/opt/system/Advanced/Switch to main SD for Roms.sh" ]; then
		  sudo cp -f -v "/usr/local/bin/Switch to main SD for Roms.sh" "/opt/system/Advanced/Switch to main SD for Roms.sh" | tee -a "$LOG_FILE"
		else
		  sed -i '/roms2/s//roms/g'  /home/ark/.atari800.cfg
		  sed -i '/roms2/s//roms/g'  /home/ark/.config/retroarch/config/Atari800/retroarch_5200.cfg
		  sed -i '/roms2/s//roms/g'  /home/ark/.config/retroarch/config/Atari800/retroarch_A800.cfg
		  sed -i '/roms2/s//roms/g'  /home/ark/.config/retroarch/config/Atari800/retroarch_XEGS.cfg
		  sudo cp -f -v "/usr/local/bin/Switch to SD2 for Roms.sh" "/opt/system/Advanced/Switch to SD2 for Roms.sh" | tee -a "$LOG_FILE"
		fi
		sed -i '/audio_volume \= \"-4.500000\"/c\audio_volume \= \"6.0\"' /home/ark/.config/retroarch32/retroarch.cfg
		sed -i '/audio_volume \= \"0.500000\"/c\audio_volume \= \"6.0\"' /home/ark/.config/retroarch/retroarch.cfg
		sudo rm -v /home/ark/arkosupdate05042021.zip | tee -a "$LOG_FILE"
	else 
		printf "\nThe update couldn't complete because the package did not download correctly.\nPlease retry the update again." | tee -a "$LOG_FILE"
		sleep 3
		echo $c_brightness > /sys/devices/platform/backlight/backlight/backlight/brightness
		exit 1
	fi

	printf "\nMake sure the proper SDLs are still linked\n" | tee -a "$LOG_FILE"
	sudo ln -sfv /usr/lib/aarch64-linux-gnu/libSDL2-2.0.so.0.10.0 /usr/lib/aarch64-linux-gnu/libSDL2-2.0.so.0 | tee -a "$LOG_FILE"
	sudo ln -sfv /usr/lib/arm-linux-gnueabihf/libSDL2-2.0.so.0.10.0 /usr/lib/arm-linux-gnueabihf/libSDL2-2.0.so.0 | tee -a "$LOG_FILE"
	
	printf "\nUpdate boot text to reflect current version of ArkOS\n" | tee -a "$LOG_FILE"
	sudo sed -i "/title\=/c\title\=ArkOS V (Test Release 2.3)" /usr/share/plymouth/themes/text.plymouth

	touch "/home/ark/.config/.update05042021"
fi

if [ ! -f "$UPDATE_DONE" ]; then

	printf "\nUpdate Retroarch to version 1.9.2\nUpdate Dingux Commander for better screen visibility\n" | tee -a "$LOG_FILE"
	sudo wget -t 3 -T 60 --no-check-certificate http://gitcdn.link/cdn/christianhaitian/arkos/main/05052021/rg351v/arkosupdate05052021.zip -O /home/ark/arkosupdate05052021.zip -a "$LOG_FILE" || rm -f /home/ark/arkosupdate05052021.zip | tee -a "$LOG_FILE"
	if [ -f "/home/ark/arkosupdate05052021.zip" ]; then
		cp -v /opt/retroarch/bin/retroarch /opt/retroarch/bin/retroarch.191.bak | tee -a "$LOG_FILE"
		cp -v /opt/retroarch/bin/retroarch32 /opt/retroarch/bin/retroarch32.191.bak | tee -a "$LOG_FILE"
		sudo unzip -X -o /home/ark/arkosupdate05052021.zip -d / | tee -a "$LOG_FILE"
		sudo rm -v /home/ark/arkosupdate05052021.zip | tee -a "$LOG_FILE"
	else 
		printf "\nThe update couldn't complete because the package did not download correctly.\nPlease retry the update again." | tee -a "$LOG_FILE"
		sleep 3
		echo $c_brightness > /sys/devices/platform/backlight/backlight/backlight/brightness
		exit 1
	fi

	printf "\nMake sure the proper SDLs are still linked\n" | tee -a "$LOG_FILE"
	sudo ln -sfv /usr/lib/aarch64-linux-gnu/libSDL2-2.0.so.0.10.0 /usr/lib/aarch64-linux-gnu/libSDL2-2.0.so.0 | tee -a "$LOG_FILE"
	sudo ln -sfv /usr/lib/arm-linux-gnueabihf/libSDL2-2.0.so.0.10.0 /usr/lib/arm-linux-gnueabihf/libSDL2-2.0.so.0 | tee -a "$LOG_FILE"
	
	printf "\nUpdate boot text to reflect current version of ArkOS\n" | tee -a "$LOG_FILE"
	sudo sed -i "/title\=/c\title\=ArkOS V (Test Release 2.4)" /usr/share/plymouth/themes/text.plymouth

	touch "$UPDATE_DONE"
	rm -v -- "$0" | tee -a "$LOG_FILE"
	printf "\033c" >> /dev/tty1
	LD_LIBRARY_PATH=/usr/local/bin msgbox "Updates have been completed.  System will now restart after you hit the A or B button to continue.  If the system doesn't restart after pressing A, just restart the system manually."
	echo $c_brightness > /sys/devices/platform/backlight/backlight/backlight/brightness
	sudo reboot
	exit 187	
fi