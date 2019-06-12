const axios = require('axios');
const SocksProxyAgent = require('socks-proxy-agent');


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
  const proxyHost = "localhost", proxyPort = 14122;
  const proxyOptions = `socks5://${proxyHost}:${proxyPort}`;
  const httpsAgent = new SocksProxyAgent(proxyOptions);
  const client = axios.create({httpsAgent});
  const response = await client.post('https://repo.adeo.no/service/extdirect',
      request);
  let version;

  response.data.result.data.forEach(row => {
    if (!version) {
      const parts = row.version.split('_');
      if (parts[1] && parts[1].startsWith('20')) {
        version = row.version;
      }
      if (row.version.startsWith('v20')) {
        version = row.version;
      }
    }
  });
  return version;
};

