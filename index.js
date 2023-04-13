const jsonfile = require('jsonfile');
const moment = require('moment');
const simpleGit = require('simple-git');
const { Random } = require("random-js");
const random = new Random(); // uses the nativeMath engine
const FILE_PATH = './data.json';

const makeComit = (n) => {
    if(n=== 0) return simpleGit().push();
    const x = random.integer(1, 54);
    const y = random.integer(0,6);
    const DATE = moment().subtract(1, 'y').add(1, 'd')
                .add(x, 'w')
                .add(y, 'd')
                .format();
    const data = {
        date: DATE
    }

    jsonfile.writeFile(FILE_PATH, data, () => {
        //get commit --date=""
        simpleGit().add([FILE_PATH]).commit(DATE, {'--date': DATE}, 
        makeComit.bind(this, --n));
    });

}

makeComit(140);