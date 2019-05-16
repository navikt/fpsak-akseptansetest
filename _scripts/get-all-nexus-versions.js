const getVersion = require("./nexus-versions");

async function test(imageName) {
  const version = await getVersion(imageName);
  console.log(imageName, version);
}

const fpApps = [
  'fpmock2',
  'fpsak',
  'fpabonnent',
  'fpfordel',
  'fpformidling',
  'fpsak-frontend',
  'fpinfo-intern',
  'fpfordel',
  'fplos',
  'fpoppdrag',
  'fprisk',
  'fptilbake',
];
fpApps.forEach(imageName => test(imageName));

