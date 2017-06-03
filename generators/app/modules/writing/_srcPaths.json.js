const extend = require('deep-extend')

function srcPathsJson(files = {}) {
    extend(files.pkg, {
        src: {
            assets: "___src/assets/",
            js: "___src/assets/js/",
            vue: "___src/assets/vue/",
            css: "___src/assets/css/",
            fonts: "___src/assets/fonts/",
            images: {
                base: "___src/assets/images/",
                bitmap: {
                    base: "___src/assets/images/bitmap/",
                    favicons: "___src/assets/images/bitmap/favicons/"
                },
                svg: {
                    base: "___src/assets/images/svg/",
                    single: "___src/assets/images/svg/single/",
                    sprite: "___src/assets/images/svg/sprite/"
                }
            },
            templates: "___src/templates/",
            system: "___src/_system/",
            dataDir: "___src/_data/",
            dataFile: "___src/_data/global.json"
        }
    })
}

module.exports = srcPathsJson
