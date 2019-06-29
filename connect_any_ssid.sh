#!bin/bash

AIRPORT="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"

LAB_WIFI_SSID=$l_ssid
LAB_WIFI_PASSWORD=$l_password

UNIVERSITY_SSID=$u_ssid
UNIVERSITY_PW=$u_pw
STUDENT_ID=$s_id
STUDENT_PW=$s_pw


# 研究室のwifiがあるかどうか、且つ電波強度が一定以上か
is_exist_fujiwifi=($(eval $AIRPORT --scan=$LAB_WIFI_SSID | grep $LAB_WIFI_SSID))

# 大学のwifiがあるかどうか
is_exist_university=($(eval $AIRPORT --scan=$UNIVERSITY_SSID | grep $UNIVERSITY_SSID))


if [[ -z is_exist_fujiwifi ]]; then
    networksetup -setairportnetwork en0 $LAB_WIFI_SSID $LAB_WIFI_PASSWORD
elif [[ -z is_exist_university ]]; then
    networksetup -setairportnetwork en0 $UNIVERSITY_SSID $UNIVERSITY_PW && \
    curl -X POST https://auth.it-chiba.ac.jp/cgi-bin/adeflogin.cgi -d name=$STUDENT_IDの学籍番号 -d pass=STUDENT_PW -d cmd=authenticate
fi
