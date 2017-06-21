const extend = require('deep-extend')

function addDistPathsCraftCMS(files = {}) {
    extend(files.pkg, {
        dist: {
            base: '___dist/public/',
            markup: '___dist/craft/templates/',
            browserSyncDir: '___dist/public/',
            assets: '___dist/public/assets/',
            js: '___dist/public/assets/js/',
            vue: '___dist/public/assets/vue/',
            css: '___dist/public/assets/css/',
            fonts: '___dist/public/assets/fonts/',
            images: {
                base: '___dist/public/assets/images/',
                bitmap: {
                    base: '___dist/public/assets/images/bitmap/',
                    favicons: '___dist/public/assets/images/bitmap/favicons/',
                    faviconPath: '{{ rootUrl }}assets/images/bitmap/favicons/'
                },
                svg: {
                    base: '___dist/public/assets/images/svg/',
                    single: '___dist/public/assets/images/svg/single/',
                    sprite: '___dist/public/assets/images/svg/sprite/'
                }
            }
        }
    })
}

module.exports = addDistPathsCraftCMS
