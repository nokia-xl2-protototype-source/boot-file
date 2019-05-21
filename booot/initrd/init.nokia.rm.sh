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
product_brand=`getprop ro.product.brand`
platform_version=`getprop ro.build.version.release`
build_id=`getprop ro.build.id`
build_number=`getprop ro.build.version.incremental`
build_type=`getprop ro.build.type`
build_version_tags=`getprop ro.build.tags`

case "$bom" in
	row.ss*)
		setprop ro.product.name "RM-1055"
		setprop ro.product.model "Nokia_X"
		setprop ro.product.device "RM-1055"
		setprop ro.product.usb.name "genm16 (RM-1055)"
		setprop ro.build.fingerprint "$product_brand/RM-1055/RM-1055:$platform_version/$build_id/$build_number:$build_type/$build_version_tags"
		echo "genm16 (RM-1055)" > /sys/class/android_usb/android0/iProduct
		setprop persist.radio.multisim.config "ss"
		;;
	td.ss*)
		setprop ro.product.name "RM-1056"
		setprop ro.product.model "Nokia_X"
		setprop ro.product.device "RM-1056"
		setprop ro.product.usb.name "genm17 (RM-1056)"
		setprop ro.build.fingerprint "$product_brand/RM-1056/RM-1056:$platform_version/$build_id/$build_number:$build_type/$build_version_tags"
		echo "genm17 (RM-1056)" > /sys/class/android_usb/android0/iProduct
		setprop persist.radio.multisim.config "ss"
		;;
esac
