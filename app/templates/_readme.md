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
