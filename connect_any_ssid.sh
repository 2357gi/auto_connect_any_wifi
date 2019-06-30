#!bin/zsh

AIRPORT="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"

PRIMARY_SSID=$l_ssid
PRIMARY_PASSWORD=$l_password

SECONDRY_SSID=$u_ssid
SECONDRY_PW=$u_pw
STUDENT_ID=$s_id
STUDENT_PW=$s_pw

function is_exist_wifi() {
    SSID=$1
    echo $SSID
    $AIRPORT -s | grep "$SSID" > /dev/null 2>&1
    return $?
}

function is_primary_ssid() {
    $AIRPORT -I | grep $PRIMARY_SSID > /dev/null 2>&1
    return $?
}

if [[ `is_primary_ssid` -eq 0 ]]; then
    echo "you dont connect primary ssid."
    echo "try to connect primary ssid."
    if [[ `is_exist_wifi $PRIMARY_SSID` -eq 0 ]]; then
        echo " you find primary ssid. connect it."
        networksetup -setairportnetwork en0 $PRIMARY_SSID $PRIMARY_PASSWORD
    elif [[ `is_exist_wifi $SECONDRY_SSID` -eq 0 ]]; then
        echo " you find seccondry ssid. connect it."
        networksetup -setairportnetwork en0 $SECONDRY_SSID $SECONDRY_PW && \
        curl -X POST https://auth.it-chiba.ac.jp/cgi-bin/adeflogin.cgi -d name=$STUDENT_ID -d pass=$STUDENT_PW -d cmd=authenticate
    fi
fi

