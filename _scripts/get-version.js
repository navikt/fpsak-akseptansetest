const getVersion = require('./nexus-versions');

getVersion(process.argv[2]).then(version => console.log(version));

