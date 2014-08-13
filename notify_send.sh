#!/bin/sh
function count_file() {
    local CURENT_NUM=`ls -lh $DIR | wc -l `;
    return $CURENT_NUM;
}

function send_mail() {
    local from_name=""  
    local from=""  
    local to=""  
    local email_title="Test Mail"  
    local email_content="new files:"  
    local email_subject="New metron file found";
    local files=$1;
    email_content="$email_content $files";
    echo $email_content;
     echo -e "To: \"${email_title}\" <${to}>\nFrom: \"${from_name}\"
    <${from}>\nSubject: ${email_subject}\n\n`echo ${email_content}`" |
    /usr/sbin/sendmail -t
    return 0;
}

function get_files() {
    local DIR=$1;
    local files="";
    for name in `ls $DIR`
    do
        files="$files $name";
    done
    echo $files;
}
#send_mail;

DIR="/home/metron/"

count_file;
CURENT_NUM=$?;
echo "NOW There are $CURENT_NUM files in $DIR";

ORIGIN_FILES=$(get_files $DIR);
echo $ORIGIN_FILES;

while [ 1 ];
do
    sleep 5;
    count_file;
    NUM=$?;
    if [ $NUM != $CURENT_NUM ];
    then
        NOW_FILES=$(get_files $DIR);
        NEW_FILES="";
        echo $NOW_FILES;
        for file in $NOW_FILES
        do
            found=0;
            for a in $ORIGIN_FILES
            do
                if [ $file = $a ];
                then
                    found=1;
                fi
            done
            if [ $found -eq 0 ];
            then
                NEW_FILES=($NEW_FILES $file);
            fi
        done
        echo $NEW_FILES     
        send_mail $NEW_FILES;
        break;
    fi
    echo "still $NUM files"; 
done
