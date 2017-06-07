import gulp from 'gulp'
import del from 'del'
import pkg from '../../package.json'

// Clean Dist
gulp.task('clean:dist', (cb) => {
    return del([
        `${pkg.dist.markup}**/*`
    ], {
        force: true
    }, cb)
})

// Clean Templates
gulp.task('clean:templates', (cb) => {
    return del([
        `${pkg.dist.markup}**/*`
    ], {
        force: true
    }, cb)
})

// Clean Images
gulp.task('clean:images', (cb) => {
    return del([
        `${pkg.dist.images.base}**/*.{jpeg,jpg,gif,png,webp,svg,ico}`
    ], {
        force: true
    }, cb)
})

// Clean JS
gulp.task('clean:js', (cb) => {
    return del([
        `${pkg.dist.js}**/*`
    ], {
        force: true
    }, cb)
})

// Clean CSS
gulp.task('clean:css', (cb) => {
    return del([
        `${pkg.dist.css}**/*`
    ], {
        force: true
    }, cb)
})
