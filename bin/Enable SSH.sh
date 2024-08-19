#!/bin/sh
# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2024 SteamFork (https://github.com/SteamFork)

if [ "$(systemctl is-enabled sshd)" = "enabled" ]
then
	ENABLED="TRUE"
else
	ENABLED="FALSE"
fi

case ${1} in
	check)
		echo ${ENABLED}
		exit 0
		;;
	FALSE)
		sudo systemctl stop sshd
		sudo systemctl disable sshd
		;;
	TRUE)
		if [ "${INSTALLED}" = "TRUE" ]
		then
			echo "Already installed."
			exit 0
		fi
		sudo systemctl enable sshd
		sudo systemctl start sshd
		;;
esac
