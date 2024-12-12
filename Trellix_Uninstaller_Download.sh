#!/bin/bash
for i in $(cat serverlist.txt)
do
    echo "====================================================================================" >> output.txt
    sshpass -p "" ssh -tt -o StrictHostKeyChecking=no $i "
        sudo su - <<EOF
        hostname
        curl -LO https://raw.githubusercontent.com/CloudScriptDepot/CrowdStrikeGit/refs/heads/main/Trellix_Uninstall.sh
        chmod +x Trellix_Uninstall.sh
        ./Trellix_Uninstall.sh
        systemctl status xagt
EOF
    " >> output.txt
    echo "====================================================================================" >> output.txt
done

