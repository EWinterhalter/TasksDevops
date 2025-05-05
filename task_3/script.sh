source secret.sh
#здесь хранятся значения переменных

PERCENT=$(df / | tail -1 | awk '{print $5}' | tr -d '%')

echo "percentage of memory used $PERCENT%"

if [ "$PERCENT" -ge 83 ]; then
    SUBJECT="Percentage of memory used is high"
    MESSAGE="On your disk used $PERCENT%."

    echo -e "From: $SMTP_USER\nTo: $EMAIL_TO\nSubject: $SUBJECT\n\n$MESSAGE" \
    | curl --url "smtps://$SMTP_SERVER:$SMTP_PORT" \
        --ssl-reqd \
        --mail-from "$SMTP_USER" \
        --mail-rcpt "$EMAIL_TO" \
        --user "$SMTP_USER:$SMTP_PASS" \
        --upload-file -
else
    echo 'Percentage of memory used is ok'
fi

