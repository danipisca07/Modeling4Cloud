PROVIDER=$1
FROMZONE=$2
TOZONE=$3
FROMHOST="$(curl ipinfo.io/ip)"
TOHOST=$4
PORT=$5 #-p
NUMBER=$6
DURATION=$7 #-t
PARALLEL=$8 #-P
INTERVAL=$9 #-i

if [ ! $PORT ]
	then
		PORT=80
		echo using port $PORT
fi
if [ ! $DURATION ]
	then
		DURATION=1
		echo using duration $DURATION sec
fi
if [ ! $PARALLEL ]
	then
		PARALLEL=1
		echo using $PARALLEL parallel connection
fi
if [ ! $INTERVAL ]
	then
		INTERVAL=$DURATION
		echo using interval $DURATION sec
fi

if [ ! -d ~/csvIperf ]; then
  mkdir ~/csvIperf
fi

LINE=$(sudo iperf3 -c $TOHOST -p $PORT -t $DURATION -P $PARALLEL -i $INTERVAL -V | tail -n 5 | head -1)

echo $LINE
TODAY=$(date +%Y-%m-%d)
TIMESTAMP=$(date "+%Y-%m-%dT%H:%M:%S-00:00")
BANDWIDTH=$(echo $LINE | awk '{print $7}' | cut -d= -f2)
TRANSFER=$(echo $LINE | awk '{print $5}' | cut -d= -f2)
RETRANSMISSIONS=$(echo $LINE | awk '{print $9}' | cut -d= -f2)
FILE=~/csvIperf/$PROVIDER-$NUMBER-$TODAY.csv

if ! [ -s $FILE ]
	then
		printf "provider,from_zone,to_zone,from_host,to_host,timestamp,bandwidth,duration,parallel,transfer,retransmissions\n" >> $FILE
fi


printf "$PROVIDER,$FROMZONE,$TOZONE,$FROMHOST,$TOHOST,$TIMESTAMP,$BANDWIDTH,$DURATION,$PARALLEL,$TRANSFER,$RETRANSMISSIONS\n" >> $FILE
# curl -d "provider=$PROVIDER&fromZone=$FROMZONE&toZone=$TOZONE&fromHost=$FROMHOST&toHost=$TOHOST&icmp_seq=$ICMPSEQ&ttl=$TTL&time=$TIME" -X POST $SERVER

#Duration 3 parallel 1 interval 3 = network usage 372 MB
#Duration 1 parallel 1 interval 1 = network usage 122 MB
