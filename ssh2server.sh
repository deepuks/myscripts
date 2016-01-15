#!/bin/bash
case "$1" in
1|R6.7|RHEL6.7|RHEL6) echo "Logging to RHEL 6.7 as root user"; 
ssh -X root@`cat ip_address | grep -i R6.7 | awk '{print $3}'`
;;
2|R6.6new|RHEL6.6) echo "Logging to RHEL 6.6new as root user";
ssh -X root@`cat ip_address | grep -i R6.6new | awk '{print $3}'`
;;
3|R6.3|RHEL6.3) echo "Logging to RHEL 6.3 as root user";
ssh -X root@`cat ip_address | grep -i R6.3 | head -1 | awk '{print $3}'`
;;
4|R6.4|RHEL6.4) echo "Logging to RHEL 6.4 as root user";
ssh -X root@`cat ip_address | grep -i R6.4 | awk '{print $3}'`
;;
5|R5.11|RHEL5.11|RHEL5) echo "Logging to RHEL 5.11 as root user";
ssh -X root@`cat ip_address | grep -i R5.11 | awk '{print $3}'`
;;
6|R6.3_32|RHEL6.3_32) echo "Logging to RHEL 32-bit 6.3 as root user";
ssh -X root@`cat ip_address | grep -i R6.3_32 | awk '{print $3}'`
;;
7|R7.1PH|RHEL7.1PH|RHEL7) echo "Logging to RHEL 7phy as root user";
ssh -X root@`cat ip_address | grep -i R7.1PH | awk '{print $3}'`
;;
8|R7.2|RHEL7.2) echo "Logging to RHEL 7phy as root user";
ssh -X root@`cat ip_address | grep -i R7.2 | awk '{print $3}'`
;;
help|--help) echo "Usage : ./ssh-server.sh <number|name|RHEL_version>";
;;
*) echo -e "This entry can't be found on 'ip_address' list!\n# cat ip_address to list.\n";
echo "Usage : ./ssh-server.sh <number|name|RHEL_version>"
;;
esac
