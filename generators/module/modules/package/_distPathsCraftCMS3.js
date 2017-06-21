const extend = require('deep-extend')

function addDistPathsCraftCMS3(files = {}) {
    extend(files.pkg, {
        dist: {
            base: '___dist/web/',
            markup: '___dist/templates/',
            browserSyncDir: '___dist/web/',
            assets: '___dist/web/assets/',
            js: '___dist/web/assets/js/',
            vue: '___dist/web/assets/vue/',
            css: '___dist/web/assets/css/',
            fonts: '___dist/web/assets/fonts/',
            images: {
                base: '___dist/web/assets/images/',
                bitmap: {
                    base: '___dist/web/assets/images/bitmap/',
                    favicons: '___dist/web/assets/images/bitmap/favicons/',
                    faviconPath: '{{ rootUrl }}assets/images/bitmap/favicons/'
                },
                svg: {
                    base: '___dist/web/assets/images/svg/',
                    single: '___dist/web/assets/images/svg/single/',
                    sprite: '___dist/web/assets/images/svg/sprite/'
                }
            }
        }
    })
}

module.exports = addDistPathsCraftCMS3
