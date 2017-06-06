const extend = require('deep-extend')

function addDistPathsPrototyping(files = {}) {
    extend(files.pkg, {
        dist: {
            base: '___dist/',
            markup: '___dist/',
            browserSyncDir: '___dist/',
            assets: '___dist/assets/',
            js: '___dist/assets/js/',
            vue: '___dist/assets/vue/',
            css: '___dist/assets/css/',
            fonts: '___dist/assets/fonts/',
            images: {
                base: '___dist/assets/images/',
                bitmap: {
                    base: '___dist/assets/images/bitmap/',
                    favicons: '___dist/assets/images/bitmap/favicons/',
                    faviconPath: '___dist/assets/images/bitmap/favicons/'
                },
                svg: {
                    base: '___dist/assets/images/svg/',
                    single: '___dist/assets/images/svg/single/',
                    sprite: '___dist/assets/images/svg/sprite/'
                }
            }
        }
    })
}

module.exports = addDistPathsPrototyping

