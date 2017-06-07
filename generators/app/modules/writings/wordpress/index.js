const installWordpress = () => {
    return {
        download: (context) => {
            return context.spawnCommandSync('wp', ['core', 'download', '--path=___dist'])
        }
    }
}

module.exports = installWordpress

