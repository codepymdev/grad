// const jsonfile = require('jsonfile');
const moment = require('moment');
const simpleGit = require('simple-git');


const DATE = moment().subtract(5, 'months').format();
simpleGit().add("./*").commit("fac: Theme of Context", {'--date': DATE}).push();
