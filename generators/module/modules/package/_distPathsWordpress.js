const extend = require('deep-extend')

function addDistPathsWordpress(files = {}) {
    extend(files.pkg, {
        dist: {
            base: '___dist/',
            markup: '___dist/wp-content/themes/<%= projectName %>/',
            browserSyncDir: '___dist/wp-content/themes/<%= projectName %>/',
            assets: '___dist/wp-content/themes/<%= projectName %>/assets/',
            js: '___dist/wp-content/themes/<%= projectName %>/assets/js/',
            vue: '___dist/wp-content/themes/<%= projectName %>/assets/vue/',
            css: '___dist/wp-content/themes/<%= projectName %>/assets/css/',
            fonts: '___dist/wp-content/themes/<%= projectName %>/assets/fonts/',
            images: {
                base: '___dist/wp-content/themes/<%= projectName %>/assets/images/',
                bitmap: {
                    base: '___dist/wp-content/themes/<%= projectName %>/assets/images/bitmap/',
                    favicons: '___dist/wp-content/themes/<%= projectName %>/assets/images/bitmap/favicons/',
                    faviconPath: '<?php bloginfo(\'template_directory\' ); ?>/assets/images/bitmap/favicons/'
                },
                svg: {
                    base: '___dist/wp-content/themes/<%= projectName %>/assets/images/svg/',
                    single: '___dist/wp-content/themes/<%= projectName %>/assets/images/svg/single/',
                    sprite: '___dist/wp-content/themes/<%= projectName %>/assets/images/svg/sprite/'
                }
            }
        }
    })
}

module.exports = addDistPathsWordpress
