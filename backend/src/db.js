const url = 'mongodb://localhost:27042/pings';
// const url = 'mongodb://albertobagnacani:modeling4cloud@10.0.0.14/pings'; // TODO secrets?
//const url = 'mongodb://albertobagnacani:modeling4cloud@137.204.57.93:27017/pings'; // TODO secrets?
var mongoose = require('mongoose');

mongoose.connect(url, function(err, db){
    if (err) console.log('Unable to connect to DB ' + url + '. Error: ' + err);
    else console.log('Connection established to DB:' + url);
});