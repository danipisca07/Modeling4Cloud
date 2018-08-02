PROVIDER=$1
FROMZONE=$2
TOZONE=$3
TOIP=$4
SEQ_NUMBER=$5
BACKEND_ADDR=$6

#Download da github
#rm -r -f ~/Modeling4Cloud 
#git clone https://github.com/danipisca07/Modeling4Cloud.git


#Avvia pinging
chmod +x ~/Modeling4Cloud/utils/registerHpingCsv.sh #Rende eseguibile lo script per il pinging
nohup ~/Modeling4Cloud/utils/registerHpingCsv.sh $PROVIDER $FROMZONE $TOZONE $TOIP $SEQ_NUMBER > $FROMZONE-$TOZONE-$SEQ_NUMBER.out 2> $FROMZONE-$TOZONE-$SEQ_NUMBER.err < /dev/null &
#~/Modeling4Cloud/utils/registerHpingCsv.sh $PROVIDER $FROMZONE $TOZONE $TOIP $SEQ_NUMBER


#Schedula lo script per il caricamento al backend dei ping ogni mezzanotte
cline="~/Modeling4Cloud/utils/curlCsv.sh $PROVIDER $SEQ_NUMBER $BACKEND_ADDR"
chmod +x ~/Modeling4Cloud/utils/curlCsv.sh #Rende eseguibile lo script per il caricamento dei ping eseguiti
#crontab -r #Rimuove tutti i crontab
if ! crontab -l | grep -q "$cline" ; then
	(crontab -l ; echo ' 0 0 * * *' "$cline" ) | crontab - 
	echo Aggiunto job crontab
else
	echo Crontab job già presente
fi