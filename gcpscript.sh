DATE=$(date +%H-%M-%S)
HOSTNAME=$1
DB_PASSWD=$2
DB_NAME=$3
GCP_KEY=$4
BUCKET_NAME=$5



mysqldump --column-statistics=0  -u root -h $HOSTNAME -p$DB_PASSWD $DB_NAME > /tmp/db-$DATE.sql && \
export GCP_ACCESS_KEY_ID=GOOG1E5YLSV2L6DTQMALMBWS7VCFDZUOBTNV67AFZKXZVLITAYHYH45ZMCZ6I && \
export GCP_SECRET_ACCESS_KEY=$GCP_KEY && \
echo "uploading your data"
gsutil cp /tmp/db-$DATE.sql gs://$BUCKET_NAME
