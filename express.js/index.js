const util = require('util');
const express = require('express');
const app = express();

function handler(req, res) {
  console.log();
  [ { k: "Method",  v: req.method },
    { k: "Path",    v: req.path },
    { k: "Headers", v: req.headers },
    { k: "Query",   v: req.query },
    { k: "Body",    v: req.body }
  ].forEach(({k, v}) => {
    console.log(`${k}: ${util.inspect(v)}`);
  });

  res.send('Hello\n');
}

app.all('/', handler);

app.listen(80, () => {
  console.log('Listening port 80');
});

process.on('SIGINT', () => {
  process.exit();
});

