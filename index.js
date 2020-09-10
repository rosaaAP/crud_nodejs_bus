//use path module
const path = require('path');
//use express module
const express = require('express');
//use hbs view engine
const hbs = require('hbs');
//use bodyParser middleware
const bodyParser = require('body-parser');
//use mysql database
const mysql = require('mysql');
const app = express();

//Create Connection
const conn = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'crud_bus'
});

//connect to database
conn.connect((err) =>{
  if(err) throw err;
  console.log('Mysql Connected...');
});

//set views file
app.set('views',path.join(__dirname,'views'));
//set view engine
app.set('view engine', 'hbs');
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
//set folder public as static folder for static file
app.use('/assets',express.static(__dirname + '/public'));

//route for homepage
app.get('/',(req, res) => {
  let sql = "SELECT * FROM bus";
  let query = conn.query(sql, (err, results) => {
    if(err) throw err;
    res.render('view',{
      results: results
    });
  });
});

//route for insert data
app.post('/save',(req, res) => {
  let data = {nama_bus: req.body.nama_bus, foto_bus: req.body.foto_bus, status: req.body.status};
  let sql = "INSERT INTO bus SET ?";
  let query = conn.query(sql, data,(err, results) => {
    if(err) throw err;
    res.redirect('/');
  });
});

//route for update data
app.post('/update',(req, res) => {
  let sql = "UPDATE bus SET nama_bus='"+req.body.nama_bus+"', foto_bus='"+req.body.foto_bus+"', status='"+req.body.status+"' WHERE id_bus="+req.body.id;
  let query = conn.query(sql, (err, results) => {
    if(err) throw err;
    res.redirect('/');
  });
});

//route for delete data
app.post('/delete',(req, res) => {
  let sql = "DELETE FROM bus WHERE id_bus="+req.body.id_bus+"";
  let query = conn.query(sql, (err, results) => {
    if(err) throw err;
      res.redirect('/');
  });
});

//server listening
app.listen(8000, () => {
  console.log('Server is running at port 8000');
});
