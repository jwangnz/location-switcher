#!/bin/sh

ssid=`/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I |grep -E '^\s*SSID' | sed 's/SSID://; s/ //g'`

# configuration
if [ $ssid = "Work" ]
then
    location="Office"
elif [ $ssid = "tsing" ]
then
    location="Home"
else
    location="Automatic"
fi

newloc=`/usr/sbin/scselect ${location} | sed 's/^.*(\(.*\)).*$/\1/'`

echo ${newloc}

if [ ${location} != ${newloc} ]
then
    exit 1
fi

exit 0
