
#!/bin/sh
#

wget -O /var/volatile/tmp/enigma2-plugin-skins-aglare-fhd_2.5_all.ipk "https://raw.githubusercontent.com/Ham-ahmed/Skins2024/main/enigma2-plugin-skins-aglare-fhd_2.5_all.ipk"
wait
opkg install --force-overwrite /tmp/*.ipk
wait
rm -f /var/volatile/tmp/enigma2-plugin-skins-aglare-fhd_2.5_all.ipk
wait
sleep 2;
exit 0

