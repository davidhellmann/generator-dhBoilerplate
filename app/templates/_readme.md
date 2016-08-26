# <%= projectName %>

# Runs with YO Generator dhBoilerplate

```
              dddddddd
              d::::::dhhhhhhh
              d::::::dh:::::h
              d::::::dh:::::h
              d:::::d h:::::h
      ddddddddd:::::d  h::::h hhhhh
    dd::::::::::::::d  h::::hh:::::hhh
   d::::::::::::::::d  h::::::::::::::hh
  d:::::::ddddd:::::d  h:::::::hhh::::::h
  d::::::d    d:::::d  h::::::h   h::::::h
  d:::::d     d:::::d  h:::::h     h:::::h
  d:::::d     d:::::d  h:::::h     h:::::h
  d:::::d     d:::::d  h:::::h     h:::::h
  d::::::ddddd::::::dd h:::::h     h:::::h
   d:::::::::::::::::d h:::::h     h:::::h
    d:::::::::ddd::::d h:::::h     h:::::h
     ddddddddd   ddddd hhhhhhh     hhhhhhh


   dhBoilerplate made with love & help.
   ---------------------------------------
   Author   :   David Hellmann
   Website  :   https://davidhellmann.com
   Github   :   https://github.com/davidhellmann/generator-dhBoilerplate
```


## Description
<%= projectDescription %>


## What's inside?

### Sass Functions
- `borderradius('level-x')` or `br('level-x')`
- `boxshadow('level-x')` or `bs('level-x')`
- `color('color-name')` or `c('color-name')`
- `ease('easing-name')` or `e('easing-name')`
- `fontfamily('font-name')` or `ff('font-name')` 
- `font-size('font-size')` or `fs('font-size')`  
- `lineheight(i)` or `lh(i)`    
- `sapce(i)` or `s(i)`  
- `verticalrhythm(i)` or `vr(i)` 

### Sass Mixins
- `@include center`
- `@include clearfix`
- `@include container('full')` ‚full‘ ist optional 
- `@include cols(i)`
- `@include filter(filter-name, value%)`
- `@include fluid-type($properties, $min-vw, $max-vw, $min-value, $max-value)` or `@include ft($properties, $min-vw, $max-vw, $min-value, $max-value)`
- `@include flexbox('full')` or `@include fb('full')` ‚full‘ is optional
- `@include flexcols(i)` or `@include fc(i)`
- `@include gutter(i)`or `@include g(i)`
- `@include pull(i)`
- `@include push(i)`
- `@include valign`
- `@include visuallyhidden` or `@include vh`



## Install NPM Packages

```
npm install
```


## Initialize Project

```
gulp init
```


### Default Task with BrowserSync

```
gulp
```


### Task for Building
This Task clean the folder, build the stuff from ground up and optimize the images and minifiy JS / CSS files. Ready for live!

```
gulp build
```


### Other Tasks
There are some other Tasks there…

```
// Clean Tasks
// Clean the specific folder in the "___dist" dir
gulp clean:templates
gulp clean:css
gulp clean:js
gulp clean:images


// Main Tasks
// All this are triggered within "gulp init" & "gulp build" task.
// Some of this are triggered within the "gulp" task.
gulp templates
gulp systemFiles
gulp modernizr
gulp compile:js
gulp sass
gulp copy:fonts
gulp images
gulp svg-single
gulp svg-sprite


// Minify Tasks
// This task are triggered within the "guld build" task.
gulp minify:js
gulp minify:sass
gulp minify:images

```


## Thanks to
- webdevs - for so many things: [Website](http://webdevs.xyz)
- Sascha Fuchs - for help help help: [Website](https://github.com/gisu)
- Martin Herweg - for help help help: [Website](https://github.com/martinherweg)
- CSS Tricks -  for Easing Map: [Website](https://css-tricks.com/snippets/sass/easing-map-get-function/)
- Florian Kutschera - for the Material Design Box Shadows: [Website](https://medium.com/@Florian/freebie-google-material-design-shadow-helper-2a0501295a2d#.f1fz5ac2o)
- Hugo Giraudel & Eduardo Bouças - for include media: [Website](http://include-media.com/)
- @LukyVj - for family.scss: [Website](http://lukyvj.github.io/family.scss/)
- inuitcss - for some snippets: [website](https://github.com/inuitcss/inuitcss)
