#!/bin/env bash

if [ "$#" -ne 3 ]
then
  echo "You must provide three ZIPs for a device."
  exit 1
fi

parse_device_name() {
    parts=(${1//-/ })
    echo ${parts[2]}
}

device_1=$(parse_device_name $1)
device_2=$(parse_device_name $2)
device_3=$(parse_device_name $3)

if [ -z "$device_1" ]; then
    echo "Not a valid zip."
    exit 1
fi

if [ "$device_1" != "$device_2" ] || [ "$device_1" != "$device_3" ]; then
  echo "The three ZIPs are not for the same device!"
  exit 1
fi

date=$(date +'%Y%m%d')
gh release create "$device_1-$date" $1 $2 $3 --title "$device-$date build" --notes "Please read the changelog at https://kenvyra.xyz/devices/$device_1/ instead."
