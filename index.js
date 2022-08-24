// const jsonfile = require('jsonfile');
const moment = require('moment');
const simpleGit = require('simple-git');


const DATE = moment().subtract(8, 'months').format();
simpleGit().add("./*").commit("fix: Update package url", {'--date': DATE}).push();
