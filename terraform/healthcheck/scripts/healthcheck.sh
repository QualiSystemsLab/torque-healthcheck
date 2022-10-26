#!/bin/bash -x
timeout=$TIMEOUT

apt-get -y install curl  

x=1 
while [ $x -le $timeout ] 
do 
    response=$(curl -Is $URL | head -n 1)
    if [[ $response == *"200"* ]]; then
        echo "$URL site up! $response" 
        exit 0 
    elif [[ $response == *"300"* ]]; then 
        echo "$URL site up! $response" 
        exit 0 
    fi 
    if [[ $x -lt $timeout ]]; then 
        sleep 30s 
    fi
    x=$(( $x + 1 )) 
done
timewaited=$((( $x - 1 ) * 30 ))
echo "$URL site never came up in $timewaited seconds, response $response"
exit 1
