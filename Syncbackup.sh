#!/bin/bash

# make sure you gave a number of seconds:
[ 0$1 -gt 0 ] || exit

    cd /home/node
    SOURCE="/home/node"
    SOURCE2="headless/.mozilla/."
    #BACKUP="gs://jsonserver-b9334.appspot.com"
    echo $BACKUP
    DESTINATION="db.json"
    FULLBACKUP="$BACKUP/"$DESTINATION
    ./gsutil/gsutil cp $FULLBACKUP /home/node
    DATE=$(date -r db.json +%s)
    #tar -xvzf $DESTINATION
    #cp -rf $SOURCE2 $SOURCE
    #find /headless/.mozilla/ -name "*.desktop" -exec cp {} $SOURCE \;
    echo "Done restore"
while true; do
    echo $DESTINATION
    #cp /headless/Desktop/*.desktop $SOURCE
    #tar -zcvf $DESTINATION $SOURCE
    DATE2=$(date -r db.json +%s)
    if [ $DATE != $DATE2 ]; then
	./gsutil/gsutil cp $DESTINATION $BACKUP
	DATE=$DATE2
    else
	echo "Same Data"
    fi
    echo "Done Backup"
    sleep $1
done

