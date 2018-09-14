#Provider, source-ssh-keyfile source-ip destination-ip source-zone destination-zone sequence-number
pings=("AWS ./keys/aws-imol-london.pem 18.130.223.116 35.180.92.154 eu-west-2c eu-west-3c 1")

#Provider, source-ssh-keyfile source-ip destination-ssh-keyfile destination-ip source-zone destination-zone connection-port sequence-number hour-interval duration parallel
iperfs=("AWS ./keys/aws-imol-london.pem 18.130.223.116 ./keys/aws-imol-paris.pem 35.180.92.154 eu-west-2c eu-west-3c 80 1 14 1 1" 
	"AWS ./keys/aws-imol-virginia.pem 54.147.226.152 ./keys/aws-imol-london.pem 18.130.223.116 us-east-1 eu-west-2c 80 2 14 1 1" 
	"AWS ./keys/aws-imol-tokyo.pem 18.179.61.138 ./keys/aws-imol-london.pem 18.130.223.116 ap-northeast-1 eu-west-2c 80 3 14 1 1" 
	"AWS ./keys/aws-imol-virginia.pem 54.147.226.152 ./keys/aws-imol-tokyo.pem 18.179.61.138 ap-northeast-1 us-east-1 80 4 14 1 1")

#Provider, source-ssh-keyfile source-ip destination-ssh-keyfile destination-ip source-zone destination-zone connection-port sequence-number
qperfs=("AWS ./keys/aws-imol-paris.pem 35.180.92.154 ./keys/aws-imol-london.pem 18.130.223.116 eu-west-3c eu-west-2c 8080 1")
