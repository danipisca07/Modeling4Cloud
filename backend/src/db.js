const url = 'mongodb://admin:admin00@ds125211.mlab.com:25211/pings-aws-eu-west-1';
// const url = 'mongodb://albertobagnacani:modeling4cloud@10.0.0.14/pings'; // TODO secrets?
//const url = 'mongodb://albertobagnacani:modeling4cloud@137.204.57.93:27017/pings'; // TODO secrets?
var mongoose = require('mongoose');

mongoose.connect(url, function(err, db){
    if (err) console.log('Unable to connect to DB. Error: ' + err);
    else console.log('Connection established to DB');
});