PROVIDER=$1 # TODO provider, number are the same in register and curl: find a method for unifying
NUMBER=$2
SERVER=$3

YESTERDAY=$(date -d "yesterday 13:00" '+%Y-%m-%d') # OS X: $(date -v-1d +%F)
TODAY=$(date +%Y-%m-%d)
#YESTERDAY=$TODAY # DEV
FILE=~/csv/$PROVIDER-$NUMBER-$YESTERDAY.csv

curl -F "data=@$FILE" $SERVER