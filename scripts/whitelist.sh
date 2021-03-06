#!/bin/bash
# This script will download and add domains from the rep to whitelist.txt file.
# Project homepage: https://github.com/Soundium/Pi_hole_Whitelist
# Licence: https://github.com/Soundium/whitelist/blob/master/LICENSE
# Created by Soundium
#================================================================================
TICK="[\e[32m ✔ \e[0m]"
PIHOLE_LOCATION="/etc/pihole"
GRAVITY_UPDATE_COMMAND="pihole -w -q"

echo -e " \e[1m This script will download and add domains from the repo to whitelist.txt \e[0m"
echo -e "\n"
echo -e " \e[1m All the domains in this list are safe to add and doesn't contain any tracking or adserving domains. \e[0m"
sleep 1
echo -e "\n"

if [ "$(id -u)" != "0" ] ; then
	echo "This script requires root permissions. Please run this as root!"
	exit 2
fi

curl -sS https://raw.githubusercontent.com/Soundium/Pi_hole_Whitelist/master/domains/whitelist.txt | sudo tee -a "${PIHOLE_LOCATION}"/whitelist.txt >/dev/null
echo -e " ${TICK} \e[32m Adding domains to whitelist... \e[0m"
sleep 0.5
echo -e " ${TICK} \e[32m Removing duplicates... \e[0m"
mv "${PIHOLE_LOCATION}"/whitelist.txt "${PIHOLE_LOCATION}"/whitelist.txt.old && sort -u "${PIHOLE_LOCATION}"/whitelist.txt.old >> "${PIHOLE_LOCATION}"/whitelist.txt

wait
echo -e " [...] \e[32m Pi-hole gravity rebuilding lists. This may take a while... \e[0m"
${GRAVITY_UPDATE_COMMAND} $(xargs -0 < "${PIHOLE_LOCATION}"/whitelist.txt) --comment "Soundium/whitelist" > /dev/null
wait
echo -e " ${TICK} \e[32m Pi-hole's gravity updated \e[0m"
echo -e " ${TICK} \e[32m Done! \e[0m"


echo -e " \e[1m  Star me on GitHub, https://github.com/Soundium/Pi_hole_Whitelist \e[0m"
echo -e " \e[1m  Happy AdBlocking :)\e[0m"
echo -e "\n\n"
