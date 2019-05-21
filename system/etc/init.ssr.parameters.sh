#!/system/bin/sh

# Copyright (c) 2014 Microsoft Mobile. All rights reserved.
#
# This software, including documentation, is protected by copyright controlled by
# Microsoft Mobile. All rights are reserved. Copying, including reproducing,
# storing, adapting or translating, any or all of this material requires the prior
# written consent of Microsoft Mobile. This material also contains confidential
# information which may not be disclosed to others without the prior written
# consent of Microsoft Mobile.

enable_str=`getprop persist.sys.ssr.restart_level`
IFS=,
enable_array=($enable_str)
declare -i enabling=0

LOG_NDEBUG=0
LOG_TAG="SsrParameterService"
LOG_NAME="${0}:"

logi ()
{
  /system/bin/log -t $LOG_TAG -p i "$LOG_NAME $@"
}

for num in "${!enable_array[@]}"
do
    case "${enable_array[$num]}" in
        "enable_ramdumps")
            enabling=1
        ;;
    esac
done

logi "Setting up SSR max amount of restarts (5/100s)"
echo 100 > /sys/module/subsystem_restart/parameters/max_history_time
echo 5 > /sys/module/subsystem_restart/parameters/max_restarts

logi "Setting up SSR with ${enable_str}"
/system/bin/ssr_setup ${enable_str}

if [ $enabling == 1 ]; then
    logi "Enabling SSR ramdumps"
    echo 1 > /sys/module/subsystem_restart/parameters/enable_ramdumps
    chmod 0664 /dev/ramdump_venus
    chmod 0664 /dev/ramdump_modem
    chmod 0664 /dev/ramdump_wcnss
    chmod 0664 /dev/ramdump_smem
    start ssr_ramdump
else
    logi "Disabling SSR ramdumps"
    echo 0 > /sys/module/subsystem_restart/parameters/enable_ramdumps
fi
