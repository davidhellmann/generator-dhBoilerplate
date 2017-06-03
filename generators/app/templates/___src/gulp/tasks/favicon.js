import config from '../../config.json'
import pkg from '../../package.json'
import gulp from 'gulp'
import gulpLoadPlugins from 'gulp-load-plugins'

const $ = gulpLoadPlugins()
const extension = <% if (projectUsage == 'WordPress' ) { %> 'php' <% } else { %> 'html' <% } %>

const createFavicons = () => {
    return gulp
        .src(config.src.images.bitmap.favicons + '_favicon.png')
        .pipe($.favicons({
            appName: pkg.name,
            appDescription: pkg.description,
            developerName: pkg.author.name,
            developerURL: pkg.author.url,
            background: '#fff',
            path: config.dist.images.bitmap.faviconPath,
            url: '',
            display: 'standalone',
            orientation: 'any',
            version: pkg.version,
            logging: true,
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
            },
            html: config.src.templates + '_partials/_header/_favicons.' + extension
        }))
        .pipe(gulp.dest(config.src.images.bitmap.favicons))
}

gulp.task('createFavicons', createFavicons)
module.exports = {createFavicons}
