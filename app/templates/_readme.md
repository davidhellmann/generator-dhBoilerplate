Boilerplate
===========

## Getting started
We need to install a few things:
- [Node](http://nodejs.org)
- [Bower](http://bower.io)
- [Gulp](http://gulpjs.com)


## Start

1. Check the `bower.json`, `package.json`and the `gulpfile.js` to set paths and so on

2. run `bower install` and `npm install`.
   This will download all vendors in the `___src/bower` directory and all gulp-modules in the `node_modules` directory.

3. run `gulp init` for Init the Project and does the following task (one time):
  - `'sass',`
  - `'scripts',`
  - `'plugins',`
  - `'templates',`
  - `'dummy',`
  - `'copyscripts',`
  - `'modernizr'`

4. run `gulp` to start the party…
