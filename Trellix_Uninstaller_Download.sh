#!/bin/bash
for i in $(cat serverlist.txt)
do
    echo "====================================================================================" >> output.txt
    sshpass -p "" ssh -tt -o StrictHostKeyChecking=no $i "
        sudo su - <<EOF
        hostname
        curl -LO https://raw.githubusercontent.com/CloudScriptDepot/LinuxScripts/refs/heads/main/Trellix_Uninstaller_Download.sh
        chmod +x Trellix_Uninstaller_Download.sh
        ./Trellix_Uninstall_Download.sh
        systemctl status xagt
EOF
    " >> output.txt
    echo "====================================================================================" >> output.txt
done

