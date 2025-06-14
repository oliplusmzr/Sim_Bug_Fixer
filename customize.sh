ui_print "
╔═══╗────╔═══╦══╦═╗╔═╗─╔═╗─────╔═══╦═══╦═══╗
║╔═╗║────║╔══╩╣╠╩╗╚╝╔╝─║╔╝─────║╔═╗║╔═╗║╔═╗║
║╚══╦╦╗╔╗║╚══╗║║─╚╗╔╝─╔╝╚╦══╦═╗║║─╚╣╚═╝║╚═╝║
╚══╗╠╣╚╝║║╔══╝║║─╔╝╚╗─╚╗╔╣╔╗║╔╝║║╔═╬══╗╠══╗║
║╚═╝║║║║║║║──╔╣╠╦╝╔╗╚╗─║║║╚╝║║─║╚╩═╠══╝╠══╝║
╚═══╩╩╩╩╝╚╝──╚══╩═╝╚═╝─╚╝╚══╩╝─╚═══╩═══╩═══╝"
MODDIR=${0%/*}
chmod 755 $MODDIR/service.sh
chmod 755 $MODDIR/post-fs-data.sh
chmod 755 $MODDIR/simfix.sh
chmod 755 $MODDIR/uninstall.sh
chmod 755 $MODDIR/another-script.sh
ui_print " Version 2.1.1"
##########################################################################################
# MMT Extended Logic - Don't modify anything after this
##########################################################################################

SKIPUNZIP=1
unzip -qjo "$ZIPFILE" 'common/functions.sh' -d $TMPDIR >&2
. $TMPDIR/functions.sh
