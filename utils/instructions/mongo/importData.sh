#!/bin/bash
echo  __________________________ Import ~/backupPings/  __________________________ 
tail -n +2 ~/backupPings/*.csv | mongoimport -h localhost:27017 -d pings -c pings --type csv --columnsHaveTypes --fields "provider.string(),from_zone.string(),to_zone.string(),from_host.string(),to_host.string(),icmp_seq.int32(),ttl.int32(),time.double(),timestamp.date(2006-01-02T15:04:05-00:00)"

echo  __________________________ Import ~/Modeling4Cloud/uploads/  __________________________ 
tail -n +2 ~/Modeling4Cloud/uploads/*.csv | mongoimport -h localhost:27017 -d pings -c pings --type csv --columnsHaveTypes --fields "provider.string(),from_zone.string(),to_zone.string(),from_host.string(),to_host.string(),icmp_seq.int32(),ttl.int32(),time.double(),timestamp.date(2006-01-02T15:04:05-00:00)"

echo  __________________________ Import ~/backupBWT/  __________________________ 
tail -n +2 ~/backupBWT/*.csv | mongoimport -h localhost:27017 -d pings -c bandwidths --type csv --columnsHaveTypes --fields "provider.string(),from_zone.string(),to_zone.string(),from_host.string(),to_host.string(),timestamp.date(2006-01-02T15:04:05-00:00),bandwidth.double(),duration.int32(),parallel.int32(),transfer.double(),retransmissions.int32()"

echo  __________________________ Import ~/Modeling4Cloud/uploadsBW/  __________________________ 
tail -n +2 ~/Modeling4Cloud/uploadsBW/*.csv | mongoimport -h localhost:27017 -d pings -c bandwidths --type csv --columnsHaveTypes --fields "provider.string(),from_zone.string(),to_zone.string(),from_host.string(),to_host.string(),timestamp.date(2006-01-02T15:04:05-00:00),bandwidth.double(),duration.int32(),parallel.int32(),transfer.double(),retransmissions.int32()"

echo __________________________ Cleanup __________________________
mongo --port 27017 <<MONGO
use pings
db.pings.deleteMany({ provider: { $regex: '==>*' } })
db.bandwidths.deleteMany({ provider: { $regex: '==>*' } })
MONGO