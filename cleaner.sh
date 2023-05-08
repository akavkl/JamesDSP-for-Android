MODPATH=${0%/*}
PKG=`cat $MODPATH/package.txt`
for PKGS in $PKG; do
  rm -rf /data/user*/*/$PKGS/cache/*
done


