// Import express
let express = require('express');
// Import Body parser
let bodyParser = require('body-parser');

// Initialise the app
let app = express();

const config = require('./db');

const PORT = 8080;

const client = mongodb.MongoClient;
// Import routes
let apiRoutes = require("./api-routes");
// Configure bodyparser to handle post requests
app.use(bodyParser.urlencoded({
    extended: true
}));
app.use(bodyParser.json());
// Connect to Mongoose and set connection variable
client.connect(config.DB, function(err, db) {
    if(err) {
        console.log('database is not connected')
    }
    else {
        console.log('connected!!')
    }
});


// Send message for default URL
app.get('/', (req, res) => res.send('Hello World with Express'));

// Use Api routes in the App
app.use('/api', apiRoutes);
// Launch app to listen to specified port
app.listen(port, function () {
    console.log("Running RestHub on port " + port);
});