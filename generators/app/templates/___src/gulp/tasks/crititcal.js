import gulp from 'gulp'
import critical from 'critical'
import yargs from 'yargs'
import log from 'fancy-log'
import chalk from 'chalk'
import pkg from '../../package.json'

const argv = yargs.argv
const localURL = 'http://' + pkg.browsersync.proxy
const url = argv.url || localURL


// Process data in an array synchronously, moving onto the n+1 item only after the nth item callback
function doSynchronousLoop(data, processData, done) {
    if (data.length > 0) {
        const loop = (data, i, processData, done) => {
            processData(data[i], i, () => {
                if (++i < data.length) {
                loop(data, i, processData, done)
            } else {
                done()
            }
        })
    }
        loop(data, 0, processData, done)
    } else {
        done()
    }
}

// Process the critical path CSS one at a time
function processCriticalCSS(element, i, callback) {
    const criticalSrc = url + element.url
    const criticalDest = element.template + '_critical.min.css'
    const criticalWidth = 1440
    const criticalHeight = 1280
    log(`-> Generating critical CSS: ${chalk.cyan(criticalSrc)} -> ${chalk.magenta(criticalDest)}`)
    critical.generate({
        src: criticalSrc,
        dest: criticalDest,
        inline: false,
        ignore: ['font-family'],
        // base: pkg.dist.markup,
        css: [
            pkg.dist.css + 'app.min.css',
        ],
        minify: true,
        width: criticalWidth,
        height: criticalHeight
    }, (err, output) => {
        callback()
    })
}

// critical css task
const criticalcss = (callback) => {
    doSynchronousLoop(pkg.criticalCSS, processCriticalCSS, () => {
        // all done
        callback()
    })
}

gulp.task('create:criticalcss', criticalcss)
module.exports = criticalcss
