#!/bin/bash

#A simple script that will ping the desired ips and display if any of them is down
#Change the ips to whatever you want and add a friendly name to distinguish between them
#If this script is run via cron, it will NOT display a message. Maybe I can add that later...

declare -A ips=(
	["router"]="192.168.1.1"
	["dns"]="8.8.8.8"
	["failure"]="192.168.1.42"
	["failure2"]="192.168.1.43"
)

failedIps=()
for name in "${!ips[@]}"; do
	ip=${ips[$name]}
	if ping -c 1 -w 1 "$ip" > /dev/null; then
		echo "Received response from $name ($ip)"
	else

		echo "No response from $name ($ip)"
		failedIps+=("$name")
	fi
done

if [ ${#failedIps[@]} -gt 0 ]; then
	failedIps=$(printf ", %s" "${failedIps[@]}")
	failedIps=${failedIps:2}
	echo "Failed to receive response from the following IPs: $failedIps"
else
	echo "All IPs responded successfully"
fi
