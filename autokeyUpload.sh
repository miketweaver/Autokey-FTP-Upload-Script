#!/bin/bash
#This was created by Mike Weaver github@vpsilo.com
#This script was built to automatically upload your autokeys to any FTP server you like.
#You can edit this to upload any file you like, actually. Include attribution though.

#Go ahead and fill in the following variables.
HOST='' #FTP Host
USER='' #FTP User
PASSWD='' #FTP Password
FILE='' #filename to save on the server itself
JSON='~/.config/autokey/autokey.json' #location of autokey json file. Default location is: ~/.config/autokey/autokey.json

#---------------------------------------------

mydate=`date +%Y-%m-%d-%T`
#Note. We use FTP instead of CURL because we need to move files, and it's easier this way.
ftp -p -n ${HOST} <<END_SCRIPT
quote user ${USER}
quote pass ${PASSWD}
rename ${FILE} ${FILE}.${mydate}
put ${JSON} ${FILE}
bye
END_SCRIPT

echo 'Script Finished. If there are no errors, the file was uploaded! Awesome. :)';

