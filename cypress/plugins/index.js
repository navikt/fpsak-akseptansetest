const fs = require('fs-extra');
const deepmerge = require('deepmerge');
const path = require('path');

function getConfigurationByFile(basename) {
  const pathToConfigFile = path.resolve(__dirname,'..', 'config', `${basename}.json`);
  return fs.readJsonSync(pathToConfigFile);
}

// plugins file
module.exports = (on, config) => {
  // accept a configFile value or use development by default
  const basename = config.env.ENVIRONMENT || 'vtp';
  const fileContent = getConfigurationByFile(basename);
  const newConfig = deepmerge(config, fileContent);
  return newConfig;
};
