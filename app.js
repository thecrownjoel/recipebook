var express = require('express'),
    path = require('path'),
    bodyParser = require('body-parser'),
    cons = require('consolidate'),
    dust = require('dustjs-helpers'),
    pg = require('pg'),
    app = express();

const config = {
    user: 'propjoel',
    database: 'recipebookdb',
    password: 'summer10',
    port: 5432
};

// DB Connect String
// var connect = 'postgresql://propjoel:summer10@localhost:5432/recipebookdb';

// Assign Dust Engine to .dust files
app.engine('dust', cons.dust);

// Set Default Ext .dust
app.set('view engine', 'dust');
app.set('views', __dirname + '/views');

// Set Public folder
app.use(express.static(path.join(__dirname, 'public')));

// Body Parser Middleware
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: false }))

// pool takes the object above -config- as parameter
const pool = new pg.Pool(config);

app.get('/', (req, res, next) => {
    // PG connect
    pool.connect(function(err, client, done) {
        if(err) {
            return console.error('error fetching client from pool', err);
        }
        client.query('SELECT * FROM recipes', function(err, result) {
          if(err) {
             return console.error('error running query', err);
        }        
        
        res.render('index', {recipes: result.rows});
        done();
    });
    });
 });


app.post('/add', function(req, res) {
    // PG connect
    pool.connect(function(err, client, done) {
        if(err) {
            return console.error('error fetching client from pool', err);
        }
        client.query('INSERT INTO recipes(name, ingredients, directions) VALUES($1, $2, $3)', [req.body.name, req.body.ingredients, req.body.directions]);
  
        done();
        res.redirect('/');
    });
})

// Server 
app.listen(3000, function() {
    console.log('Server started on port 3000 ');
});
