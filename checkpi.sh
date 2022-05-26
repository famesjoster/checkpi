#!/bin/bash

clear

echo "Checking Pi..."
ssh -o LogLevel=QUIET pi -t '/bin/bash -c "/usr/bin/dmesg -T | tail -n 3";
        echo "===========================================================================";
        tail -n1 /var/log/pinglog.txt
        echo "===========================================================================";
        /usr/sbin/zpool status -x;
        echo "===========================================================================";
        sudo apt update 1>&- 2>&-;
        apt list --upgradable;
#       echo "===========================================================================";
#       cd /home/pi/chia-blockchain
#       git fetch --quiet
#       git status -uno | grep behind
        echo "===========================================================================";
        free -m | egrep "Mem|Swap";
        echo "===========================================================================";
        df -h | egrep "boot|SSD|piserver";
        echo "===========================================================================";
        for i in $(lsscsi | grep -o "/dev/sd.*"); do echo "$i: $(sudo /usr/sbin/smartctl -H $i | grep -o "test result.*")"; done;
        echo "===========================================================================";
        cd /home/pi/chia-blockchain;
        . ./activate;
        chia show -s | grep Status;
        chia farm summary | egrep "status|Total|win";
        echo "===========================================================================";
        grep "[1-9] plots were eligible" ~/.chia/mainnet/log/debug.log | tail -n 3;
        echo "===========================================================================";
        echo "Last eligible plot: $(grep "[1-9] plots were eligible" ~/.chia/mainnet/log/debug.log | tail -n 1 | cut -d" " -f1)"
        echo "TIME:               $(date +%Y-%m-%dT%T.%3N)"'

exit
