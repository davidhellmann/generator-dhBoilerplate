const extend = require('deep-extend')

function addFaviconsSettings(files = {}, context) {
    extend(files.pkg, {
        favicons: {
            appName: context.props.projectName,
            appDescription: context.props.projectDescription,
            version: context.props.projectVersion,
            url: context.props.projectProxy,
            developerName: context.props.authorName,
            developerURL: context.props.authorHomepage,
            srcImage: '_favicon.png',
            background: '#000000',
            display: 'standalone',
            orientation: 'portrait',
            logging: false,
            online: false,
            icons: {
                android: true,
                appleIcon: true,
                appleStartup: true,
                coast: true,
                favicons: true,
                firefox: true,
                opengraph: false,
                twitter: false,
                windows: true,
                yandex: false
            }
        }
    })
}

module.exports = addFaviconsSettings
