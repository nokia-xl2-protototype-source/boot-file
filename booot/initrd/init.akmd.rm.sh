#!/system/bin/sh

# Copyright (c) 2014 Microsoft Mobile. All rights reserved.
#
# This software, including documentation, is protected by copyright controlled by
# Microsoft Mobile. All rights are reserved. Copying, including reproducing,
# storing, adapting or translating, any or all of this material requires the prior
# written consent of Microsoft Mobile. This material also contains confidential
# information which may not be disclosed to others without the prior written
# consent of Microsoft Mobile.

bom=`getprop ro.boot.bom`

test -e "/data/misc/akmd_pdc.txt" && exit

case "$bom" in
    row.ss)
        cp /system/etc/akm/libralte_row_ss/pdc.txt /data/misc/akmd_pdc.txt
		;;
	td.ss)
        cp /system/etc/akm/libralte_td_ss/pdc.txt /data/misc/akmd_pdc.txt
		;;
esac

sync

chmod 0666 /data/misc/akmd_pdc.txt
