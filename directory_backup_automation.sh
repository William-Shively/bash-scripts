#!/bin/bash

# script to perform backup of /etc/, /home/ and /boot/ to designated server and directory.



backup_dirs=("/etc" "/home" "/boot")
dest_dir="/backup"
dest_server="server1"
backup_date=$(date +%Y-%m-%d)

echo "Starting backup of: ${backup_dirs[@]}

for i in ${backup_dirs[@]}; do
sudo tar -Pczf /tmp/$i-$backup_date.tar.gz $i
if [ $? -eq 0 ]; then
echo "$i backup succeeded."
else   
echo "$i backup failed."
fi
scp /tmp/$i-$backup_date.tar.gz $dest_server:$dest_dir
if [ $? -eq 0 ]; then
echo "$i transfer succeded."
else
echo $i transfer failed."
fi
done
sudo rm /tmp/*.gzecho "Backup is done."