import gulp from 'gulp'
import bundleJs from '../lib/jsBundle'
import bundleVar from '../lib/jsBundleVar'

// Compile only
const compileJsTask = () => {
  const bundler = bundleVar()
  return bundleJs(bundler)

  bundleJs(bundler)
}

gulp.task('compile:js', compileJsTask)
module.exports = compileJsTask
