import gulp from 'gulp'
import gulpLoadPlugins from 'gulp-load-plugins'
import browserSync from 'browser-sync'
import api from 'stylelint'
import ansiHTML from 'ansi-html'
import yargs from 'yargs'
import pkg from '../../package.json'
import errorHandler from '../lib/errorHandler'
import postCssConfig from '../lib/postCssConfig'

const argv = yargs.argv
const $ = gulpLoadPlugins()

const compileCss = () => {
    const env = argv.env || 'development'

    return gulp
        .src([`${pkg.src.css}**/*.scss`, `${pkg.src.templates}**/*.scss`])
        .pipe(argv.source ? $.debug({verbose: true}) : $.util.noop())
        .pipe($.if(env === 'development', $.sourcemaps.init()))
        .pipe($.if(env === 'development', $.stylelint({
            syntax: 'scss',
            failAfterError: false,
            reporters: [
                {formatter: 'string', console: true},
                {
                    formatter(results) {
                        if (!api.formatters.string(results).length) return
                        const warning = `
                        <div class="bs-fullscreen" 
                          style="position: fixed; 
                          bottom: 0; 
                          left: 0; 
                          width: 100%; 
                          background: rgba(0,0,0,.85); 
                          height: 50vh;
                          max-height: 200px;
                          overflow-y: scroll;
                          color: #e8e8e8; 
                          text-align: left; 
                          white-space: pre; 
                          font-family: Menlo, Consolas, monospace; 
                          font-size: 13px; 
                          padding: 10px; 
                          line-height: 1.2;">
                          ${ansiHTML(api.formatters.string(results))}
                        </div>
`;
                        browserSync.notify(warning, 100000)
                    }
                },
            ],
        })))
        .pipe($.rename({suffix: '.min'}))
        .pipe($.sass({
            precision: 10,
            includePaths: [
                `${pkg.src.css}**/*.scss`,
                `${pkg.src.templates}**/*.scss`
            ]
        })
        .on('error', function(err) {
            const error = `
              <div class="bs-fullscreen" 
                  style="position: fixed; 
                  top: 0; 
                  left: 0; 
                  width: 100%; 
                  background: rgba(0,0,0,.85); 
                  height: 
                  100vh; 
                  color: #e8e8e8; 
                  text-align: left; 
                  white-space: pre; 
                  font-family: Menlo, Consolas, monospace; 
                  font-size: 13px; 
                  padding: 10px; 
                  line-height: 1.2;">
                <p>
                  <span style="background-color:#E36049; 
                  color:#fff; 
                      padding: 2px 4px;
                      border-radius: 2px; 
                      text-transform: uppercase">
                      ERROR
                  </span> 
                  in ${err.relativePath} on line ${err.line}:${err.column} 
                </p>
                <p>${err.messageOriginal}</p>
              </div>`;
            browserSync.notify(error, 100000)
            this.emit('end')
        })
        .on('error', errorHandler))
        .pipe($.postcss(postCssConfig()))
        .pipe(env == 'development' ? $.sourcemaps.write('./maps/') : $.util.noop())
        .pipe(gulp.dest(pkg.dist.css))
        .pipe($.size({
            title: '>>> CSS File Size: '
        }))
        .pipe(browserSync.stream({
            match: '**/*.css'
        }))
}

gulp.task('compile:css', compileCss)
module.exports = compileCss
