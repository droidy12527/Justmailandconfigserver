#! /bin/bash
printf "Memory\t\tDisk\t\tCPU\n"
end=$((SECONDS+3600))
while [ $SECONDS -lt $end ]; do
MEMORY=$(free -m | awk 'NR==2{printf "%.2f%%\t\t", $3*100/$2 }')
DISK=$(df -h | awk '$NF=="/"{printf "%s\t\t", $5}')
CPU=$(top -bn1 | grep load | awk '{printf "%.2f%%\t\t\n", $(NF-2)}')
echo "$MEMORY$DISK$CPU"
LIMIT_MEMORY=0
LIMIT_CPU=0
LIMIT_DISK=0
buska=$(echo $MEMORY | cut -d'%' -f1 | awk -F. '{print $1}')
tuska=$(echo $DISK | cut -d'%' -f1)
chuska=$(echo $CPU | cut -d'%' -f1 | awk -F. '{print $1}')
if [ "$buska" -ge "$LIMIT_MEMORY" -o "$chuska" -ge "$LIMIT_CPU" -o "$tuska" -ge "$LIMIT_DISK" ];then
echo "APNA CODE YAHA DAALDE MAIL KA"
fi
sleep 1
done
