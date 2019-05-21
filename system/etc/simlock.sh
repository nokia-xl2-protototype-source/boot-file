#!/system/bin/sh
# Copyright (c) 2014 Microsoft Mobile. All rights reserved. *
# This software, including documentation, is protected by copyright controlled by
# Microsoft Mobile. All rights are reserved. Copying, including reproducing,
# storing, adapting or translating, any or all of this material requires the prior
# written consent of Microsoft Mobile. This material also contains confidential
# information which may not be disclosed to others without the prior written
# consent of Microsoft Mobile. *

base=/system
export CLASSPATH=$base/framework/nemosrv.jar
log -p d ">simlock.sh"
if [ $(getprop sys.boot_completed) == 1 ] && [ $(getprop device.card_valid) == 0 ]; then
log -p d "simlock.sh Sending LOCKED intent for CARD 1"
exec app_process $base/bin NemoSrv "1"
elif [ $(getprop sys.boot_completed) == 1 ] && [ $(getprop device.card_2_valid) == 0 ]; then
log -p d "simlock.sh Sending LOCKED intent for CARD 2"
exec app_process $base/bin NemoSrv "2"
fi
if [ $(getprop sys.boot_completed) == 1 ] && [ $(getprop device.card_validation) == "imei" ]; then
log -p d "simlock.sh Sending SECURITY_VALIDATION_FAILED intent imei"
exec app_process $base/bin NemoSrv "imei"
elif [ $(getprop sys.boot_completed) == 1 ] && [ $(getprop device.card_validation) == "key" ]; then
log -p d "simlock.sh Sending SECURITY_VALIDATION_FAILED intent key"
exec app_process $base/bin NemoSrv "key"
elif [ $(getprop sys.boot_completed) == 1 ] && [ $(getprop device.card_validation) == "cert" ]; then
log -p d "simlock.sh Sending SECURITY_VALIDATION_FAILED intent cert"
exec app_process $base/bin NemoSrv "cert"
elif [ $(getprop sys.boot_completed) == 1 ] && [ $(getprop device.card_validation) == "other" ]; then
log -p d "simlock.sh Sending SECURITY_VALIDATION_FAILED intent other"
exec app_process $base/bin NemoSrv "other"
fi
log -p d "<simlock.sh"
