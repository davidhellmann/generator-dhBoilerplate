const download = require('download')
const ProgressBar = require('progress')
const logMessage = require('../messages/_logMessage')

const bar = new ProgressBar('[:bar] :percent :etas', {
    complete: '=',
    incomplete: ' ',
    width: 96,
    total: 0
})

const downloadFiles = ({ url, destination } = {}) => {
    logMessage({
        message: `Downloading ${url}`,
        color: 'green',
        short: true
    })

    return download(url, destination, {
        extract: true,
        mode: '775'
    }).on('response', (res) => {
        // Test Stuff from Martin
        if (process.env.NODE_ENV === 'test') {
            return
        }

        bar.total = res.headers['content-length']
        res.on('data', data => bar.tick(data.length))
    }).then(() => logMessage({
        message: 'Finished Download',
        color: 'green',
        short: true
    }))
        .catch(error => console.error(error)) // eslint-disable
}

module.exports = downloadFiles
