#!bin/bash

AIRPORT="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"
air_info=($(eval $AIRPORT --getinfo |grep -E "^ *(agrCtlRSSI|state|SSID):"|awk '{print $2}'))

rssi=${air_info[0]}
state=${air_info[1]}
ssid=${air_info[2]}

case "$state" in
    "running" )
        signal=""
        if [ $rssi -gt -50 ]; then
            signal="🤩"
        elif [ $rssi -gt -30 ]; then
            signal="😏"
        else
            signal="😇"
        fi

        airport_="${ssid}  ${signal}"
    ;;
    "init" ) airport_=" ... " ;;
    * ) airport_=" ✘  " ;;
esac

printf "${airport_} \n"

