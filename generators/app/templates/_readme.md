# <%= projectName %>
## Version <%= projectVersion %>

## Runs with YO Generator dhBoilerplate

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

## Install dhBoilerplate
```
npm i generator-dhboilerplate -g
```

## Start Generator
```
// Go to your project directory and do that
yo dhboilerplate
```

## Description
<%= projectDescription %>


## What's inside? A lot! :-)
### This three scenarios are covered by the generator:
- Craft CMS — Up to Date
- Craft CMS Beta 3 — Not for production
- WordPress — No up to date but a good startpoint
- Prototyping (with Twig) — No up to date but a good startpoint

### Settings
You can find this stuff here: `___src/assets/css/_______settings`

- **_settings.borderradius.scss**
- **_settings.boxshadows.scss**
- **_settings.breakpoints.scss**
- **_settings.colors.scss**
- **_settings.easings.scss**
- **_settings.fontfamilies.scss**
- **_settings.fonts.scss**
- **_settings.fontsizes.scss**
- **_settings.grid.scss**


### Sass Functions
You can find this stuff here: `___src/assets/css/______tools`

- `borderradius('level-x')` or `br('level-x')`
- `boxshadow('level-x')` or `bs('level-x')`
- `color('color-name')` or `c('color-name')
- `ease('easing-name')` or `e('easing-name')`
- `fontfamily('font-name')` or `ff('font-name')`
- `space(i)` or `s(i)` to use the default spacing with a custom multiplicator => **_settings.grid.scss**


### Sass Mixins
You can find this stuff here: `___src/assets/css/_______settings`

- `@include center` — to center an element.
- `@include clearfix` — add clearfix stuff magix.
- `@include filter(filter-name, value%)` — to use CSS Filters
- `@include fluid($properties, $min-vw, $max-vw, $min-value, $max-value)` or `@include f($properties, $min-vw, $max-vw, $min-value, $max-value)` — to use Fluid CSS Properties dependent to the current viewport. Next level shit!
- `@include fontsize('base', 1)` or `@include fs('base', 1)` — to set a Font Family in Combination with Line Height. Default Line Height => **_settings.fontssizes.scss**
- `@include make-section($behaviour: fixed)` — to create a section
- `@include make-row($factorMin: 1, $factorMax: 1)` — to create a row
- `@include make-col($columns: 12)` — to create a col
- `@include make-vr($factor: 1)` — to create vertical rhythm (margin-top)
- `@include make-section-padding($factor: 1)` — to create vertical rhythm (margin-top)
- `@include make-col--padding($factor: 1)` — to create col padding
- `@mixin make-section-float($behaviour: fixed)` — to create a non flexbox section
- `@mixin make-col-float($columns: 12)` — to create a floating col
- `@include offsett(i)` — to set an offset for a column. It use **margin-left** to do that.
- `@include push(i)` — to push a column. It use **left** to do that.
- `@include pull(i)` — to pull a column. It use **right** to do that.
- `@include valign` — to arrange a element vertical centered.
- `@include visuallyhidden` or `@include vh` — to hide an element visual.


## Install NPM Packages
```
npm install // yarn install
```


## Initialize Project
```
gulp init  // npm run init OR yarn init
```


### Default Task with BrowserSync
```
gulp // npm run dev OR yarn dev
```


### Task for Building
This Task clean the folder, build the stuff from ground up and optimize the images and minifiy JS / CSS files. Ready for live!

```
gulp build // npm run build OR yarn build
```


### Other Tasks
There are some other Tasks there…

```
// NPM RUN / YARN COMMANDS
"start": "gulp init",
"dev": "gulp",
"build": "gulp build",
"clean:dist": "gulp clean:dist",
"clean:templates": "gulp clean:templates",
"clean:images": "gulp clean:images",
"clean:js": "gulp clean:js",
"clean:css": "gulp clean:css",
"copy:fonts": "gulp copy:fonts",
"copy:images": "gulp 'copy:images",
"copy:svg": "gulp copy:svg",
"copy:svg-single": "gulp copy:svg-single",
"create:svg-sprite": "gulp create:svg-sprite",
"copy:systemFiles": "gulp copy:systemFiles",
"compile:css": "gulp compile:css",
"compile:js": "gulp compile:js",
"compile:templates": "gulp compile:templates",
"create:criticalcss": "gulp create:criticalcss",
"create:favicons": "gulp create:favicons",
"create:inlineJS": "gulp create:inlineJS"
```

```
// Clean Tasks
// Clean the specific folder in the "___dist" dir
gulp clean:templates
gulp clean:css
gulp clean:js
gulp clean:images
```

```
// Main Tasks
// All this are triggered within "gulp init" & "gulp build" task.
// Some of this are triggered within the "gulp" task.
gulp compile:templates
gulp create:inlineJS,
gulp copy:systemFiles
gulp modernizr
gulp compile:js
gulp compile:css
gulp copy:fonts
gulp copy:images
gulp copy:svg-single
gulp create:svg-sprite
```

```
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
- inuitcss - for some snippets and inspiration: [website](https://github.com/inuitcss/inuitcss)
