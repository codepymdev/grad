// const jsonfile = require('jsonfile');
const moment = require('moment');
const simpleGit = require('simple-git');


const DATE = moment().subtract(9, 'months').format();
simpleGit().add("./*").commit("fac: Non-teaching and teaching progress", {'--date': DATE}).push();
