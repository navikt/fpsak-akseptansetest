const axios = require('axios');

module.exports = async function getVersion(imageName) {
  const request = {
    'action': 'coreui_Search',
    'method': 'read',
    'data': [
      {
        'page': 1,
        'start': 0,
        'limit': 10,
        'sort': [{'property': 'version', 'direction': 'DESC'}],
        'filter': [
          {
            'property': 'attributes.docker.imageName',
            'value': imageName,
          }],
      }],
    'type': 'rpc',
    'tid': 28,
  };
  const response = await axios.post('https://repo.adeo.no/service/extdirect',
      request);
  let version;
  response.data.result.data.forEach(row => {
    const parts = row.version.split('_');
    if (parts[1] && parts[1].startsWith('20') && !version) {
      version = row.version;
    }
  });
  return version;
};

