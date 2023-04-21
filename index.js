// const jsonfile = require('jsonfile');
const moment = require('moment');
const simpleGit = require('simple-git');


const DATE = moment().subtract(4, 'months').format();
simpleGit().add("./*").commit("fix: Calender page", {'--date': DATE}).push();
