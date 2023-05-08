mount -o rw,remount /data
if [ ! "$MODPATH" ]; then
  MODPATH=${0%/*}
fi
if [ ! "$MODID" ]; then
  MODID=`echo "$MODPATH" | sed 's|/data/adb/modules/||' | sed 's|/data/adb/modules_update/||'`
fi
     
# cleaning
PKG=`cat $MODPATH/package.txt`
for PKGS in $PKG; do
  rm -rf /data/user*/*/$PKGS
  pm uninstall $PKG
done
rm -rf /metadata/magisk/"$MODID"
rm -rf /mnt/vendor/persist/magisk/"$MODID"
rm -rf /persist/magisk/"$MODID"
rm -rf /data/unencrypted/magisk/"$MODID"
rm -rf /cache/magisk/"$MODID"


