#!/bin/sh

if [ -d /usr/share/enigma2/hd_glass17 ]; then
echo "> removing package please wait..."
sleep 3s 

rm -rf /usr/share/enigma2/hd_glass17 >/dev/null 2>&1
SCREENPATH=/usr/lib/enigma2/python/Screens
COMPPATH=/usr/lib/enigma2/python/Components
SKINPATH=/usr/share/enigma2/hd_glass17
PLUGINPATH=/usr/lib/enigma2/python/Plugins/Extensions/setupGlass17

cp -f /etc/enigma2/skin_user-ori.xml /etc/enigma2/skin_user.xml >/dev/null 2>&1
cp -f /usr/share/enigma2/encoding-ori.conf /usr/share/enigma2/encoding.conf >/dev/null 2>&1
cp -f $SCREENPATH/InfoBarGenerics-ori.py $SCREENPATH/InfoBarGenerics.py >/dev/null 2>&1
cp -f $SCREENPATH/ChannelSelection-ori.py $SCREENPATH/ChannelSelection.py >/dev/null 2>&1
cp -f /usr/share/enigma2/keymap-ori.xml /usr/share/enigma2/keymap.xml >/dev/null 2>&1
cp -f $SCREENPATH/Menu-orig17.py $SCREENPATH/Menu.py >/dev/null 2>&1
cp -f $SCREENPATH/Menu-orig17.pyo $SCREENPATH/Menu.pyo >/dev/null 2>&1
cp -f $SCREENPATH/Menu-orig17.pyc $SCREENPATH/Menu.pyc >/dev/null 2>&1

rm -rf /usr/bin/btrGen >/dev/null 2>&1
rm -rf /usr/bin/hdd_temp_hdg >/dev/null 2>&1
rm -rf /usr/share/enigma2/encoding-ori.conf >/dev/null 2>&1
rm -rf /etc/enigma2/skin_user-ori.xml >/dev/null 2>&1
rm -rf /usr/share/enigma2/keymap-ori.xml >/dev/null 2>&1
rm -rf -f $PLUGINPATH/* >/dev/null 2>&1
rmdir $PLUGINPATH >/dev/null 2>&1
rm -rf -f $COMPPATH/g17* >/dev/null 2>&1
rm -rf -f $COMPPATH/*-new17.* >/dev/null 2>&1
rm -rf -f $COMPPATH/*-orig.* >/dev/null 2>&1
rm -rf -f $COMPPATH/Converter/g17* >/dev/null 2>&1
rm -rf -f $COMPPATH/Renderer/g17* >/dev/null 2>&1
rm -rf -f $SCREENPATH/g17* >/dev/null 2>&1
rm -rf -f $SCREENPATH/*-new17.* >/dev/null 2>&1
rm -rf -f $SCREENPATH/*-ori* >/dev/null 2>&1
rm -rf -f $SCREENPATH/G17* >/dev/null 2>&1
rm -rf -f $SKINPATH/* >/dev/null 2>&1
rmdir $SKINPATH >/dev/null 2>&1

echo "*******************************************"
echo "*             Removed Finished            *"
echo "*******************************************"
sleep 3s

else

#check image versions if supported
if grep -q parameters /usr/share/enigma2/skin_default.xml; then
 echo "Image version ok"
elif grep -q alias /usr/share/enigma2/skin_default.xml; then
 echo "Image version ok"
elif grep -q alias /usr/share/enigma2/skin.xml; then
 echo "Image version ok"
elif grep -q alias /usr/share/enigma2/skin_default/skin.xml; then
 echo "Image version ok"
else
  echo "Unsupported image version detected, sorry, this skin is unusable for this image"
  exit 1
fi

#config
skin=fullhdglass17
version=v9.17
url=https://raw.githubusercontent.com/Ham-ahmed/Skins2024/main/fullhdglass17-v9.17.tar.gz
package=/var/volatile/tmp/$skin-$version.tar.gz

echo "> Downloading $skin-$version skin  please wait ..."
sleep 3s

#remove unnecessary files and folders
if [  -d "/CONTROL" ]; then
rm -r  /CONTROL >/dev/null 2>&1
fi
rm -rf /control >/dev/null 2>&1
rm -rf /postinst >/dev/null 2>&1
rm -rf /preinst >/dev/null 2>&1
rm -rf /prerm >/dev/null 2>&1
rm -rf /postrm >/dev/null 2>&1
rm -rf /tmp/*.ipk >/dev/null 2>&1
rm -rf /tmp/*.tar.gz >/dev/null 2>&1

wget -O $package --no-check-certificate $url
tar -xzf $package -C /
extract=$?
rm -rf package >/dev/null 2>&1

echo ''
if [ $extract -eq 0 ]; then 
end_inst () {
   rm -rf $SCREENPATH/Menu-new17-38.py >/dev/null 2>&1
   rm -rf /usr/share/misc/hddtemp-deff17.db >/dev/null 2>&1
   rm -rf /etc/hddtemp-deff17.db >/dev/null 2>&1
   cp -f /etc/lcstrings-def17.list /etc/lcstrings.list >/dev/null 2>&1
   rm -rf /etc/lcstrings-def17.list>/dev/null 2>&1
   cp -f /etc/city_Code-17.txt /etc/city_Code.txt >/dev/null 2>&1
   rm -rf /etc/city_Code-17.txt >/dev/null 2>&1
   cp -f /etc/iptvprov-def17.list /etc/iptvprov.list >/dev/null 2>&1
   rm -rf /etc/iptvprov-def17.list >/dev/null 2>&1
   if [ `ls -al /etc | grep bhversion | wc -l` -gt 0 ]; then
      echo "BH detected ..."
      cp -f $PLUGINSPATH/SkinSelector/plugin.py $PLUGINSPATH/SkinSelector/plugin-ori.py >/dev/null 2>&1
      cp -f /tmp/plugin-17.py $PLUGINSPATH/SkinSelector/plugin.py >/dev/null 2>&1
   fi
   rm -rf /tmp/plugin-17.py >/dev/null 2>&1
}

SCREENPATH=/usr/lib/enigma2/python/Screens
PLUGINSPATH=/usr/lib/enigma2/python/Plugins/SystemPlugins
if [ `ls -al /usr/lib/python3.* | grep base64.py | wc -l` -gt 0 ]; then
 cp -f $SCREENPATH/Menu-new17-38.py  $SCREENPATH/Menu-new17.py >/dev/null 2>&1
fi
if [ `ls -al /usr/share/misc | grep hddtemp.db | wc -l` -gt 0 ]; then
echo " "
else
 cp -f /usr/share/misc/hddtemp-deff17.db /usr/share/misc/hddtemp.db >/dev/null 2>&1
fi
if [ `ls -al /etc | grep hddtemp.db | wc -l` -gt 0 ]; then
 echo " "
else
 cp -f /etc/hddtemp-deff17.db /etc/hddtemp.db
fi >/dev/null 2>&1
end_inst

echo "> $skin-$version skin installed successfully"
echo "> Finished"
sleep 3s
else
echo "> $skin-$version skin installation failed"
sleep 3s
fi
fi

exit 0
