// const jsonfile = require('jsonfile');
const moment = require('moment');
const simpleGit = require('simple-git');


const DATE = moment().subtract(5, 'months').format();
simpleGit().add("./*").commit("fix: Announcement Error page", {'--date': DATE}).push();
