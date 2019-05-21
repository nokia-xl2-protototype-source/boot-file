#!/system/bin/sh
#
# This file is part of device/nokia/
# Copyright (c) 2014 Microsoft Mobile. All rights reserved. *
# Contact: arto.toppi@microsoft.com
# This software, including documentation, is protected by copyright controlled by
# Microsoft Mobile. All rights are reserved. Copying, including reproducing,
# storing, adapting or translating, any or all of this material requires the prior
# written consent of Microsoft Mobile. This material also contains confidential
# information which may not be disclosed to others without the prior written
# consent of Microsoft Mobile.

[ -f /custom/variants/china_variant.bin ] && setprop ro.cta.enable true
