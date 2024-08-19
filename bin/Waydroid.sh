#!/bin/sh
# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2024 SteamFork (https://github.com/SteamFork)

if [ "$(systemctl is-active waydroid-container.service)" = "active" ]
then
	INSTALLED="TRUE"
else
	INSTALLED="FALSE"
fi

case ${1} in
	check)
		echo "${INSTALLED}"
		exit 0
		;;
	TRUE)
		git clone https://github.com/SteamFork/steamos-waydroid-installer
		cd steamos-waydroid-installer
		chmod 0755 installer.sh
		./installer.sh
		cd ..
		rm -rf steamos-waydroid-installer
		;;
	FALSE)
		zenity --info --text="Please uninstall Waydroid using Waydroid Toolbox."
		;;
esac
