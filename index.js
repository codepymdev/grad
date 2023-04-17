// const jsonfile = require('jsonfile');
const moment = require('moment');
const simpleGit = require('simple-git');


const DATE = moment().subtract(7, 'months').format();
simpleGit().add("./*").commit("update: Update Docker Container", {'--date': DATE}).push();
