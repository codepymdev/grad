// const jsonfile = require('jsonfile');
const moment = require('moment');
const simpleGit = require('simple-git');


const DATE = moment().subtract(10, 'months').format();
simpleGit().add("./*").commit("fix: style color scheme", {'--date': DATE}).push();
