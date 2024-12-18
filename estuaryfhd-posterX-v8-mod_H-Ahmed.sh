#!/bin/sh
#
cd /tmp
set -e 
 wget "https://raw.githubusercontent.com/Ham-ahmed/Skins2024/refs/heads/main/estuaryfhd-posterX-v8-mod_H-Ahmed.tar.gz"
wait
tar -xzf estuaryfhd-posterX-v8-mod_H-Ahmed.tar.gz  -C /
wait
cd ..
set +e
rm -f /tmp/estuaryfhd-posterX-v8-mod_H-Ahmed.tar.gz
sleep 2;
echo "" 
echo "" 
echo "*********************************************************"
echo "*                   INSTALLED SUCCESSFULLY              *"
echo "*                       ON - Panel                      *"
echo "*                Enigma2 restart is required            *"
echo "*********************************************************"
echo "               UPLOADED BY  >>>>   HAMDY_AHMED           "
sleep 4;
	echo '================================================='
################################################################                                                                                                                  
echo ">>>>           your Device will RESTART Now          <<<<"
echo "*********************************************************"
wait
killall -9 enigma2
exit 0
