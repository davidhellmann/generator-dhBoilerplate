'use strict';
var util   = require('util');
var path   = require('path');
var yeoman = require('yeoman-generator');
var yosay  = require('yosay');
var chalk  = require('chalk');
var mkdirp = require('mkdirp');

var dhBoilerplateGenerator = yeoman.generators.Base.extend({

  init: function () {
    this.pkg = require('../package.json');
  },

  askFor: function () {
    var done = this.async();

    // Have Yeoman greet the user.
    this.log(yosay(
      'Welcome to the impressive ' + chalk.red('dhBoilerplate') + ' generator!'
    ));

    var welcome =
      '\n ————————————————————————————————————————————————————————————————————————————————— '+
      '\n                                                                                   '+
      '\n               dddddddd                                                            '+
      '\n               d::::::dhhhhhhh                                                     '+
      '\n               d::::::dh:::::h                                                     '+
      '\n               d::::::dh:::::h                                                     '+
      '\n               d:::::d h:::::h                                                     '+
      '\n       ddddddddd:::::d  h::::h hhhhh                                               '+
      '\n     dd::::::::::::::d  h::::hh:::::hhh                                            '+
      '\n    d::::::::::::::::d  h::::::::::::::hh                                          '+
      '\n   d:::::::ddddd:::::d  h:::::::hhh::::::h                                         '+
      '\n   d::::::d    d:::::d  h::::::h   h::::::h                                        '+
      '\n   d:::::d     d:::::d  h:::::h     h:::::h                                        '+
      '\n   d:::::d     d:::::d  h:::::h     h:::::h                                        '+
      '\n   d:::::d     d:::::d  h:::::h     h:::::h                                        '+
      '\n   d::::::ddddd::::::dd h:::::h     h:::::h                                        '+
      '\n    d:::::::::::::::::d h:::::h     h:::::h                                        '+
      '\n     d:::::::::ddd::::d h:::::h     h:::::h                                        '+
      '\n      ddddddddd   ddddd hhhhhhh     hhhhhhh                                        '+
      '\n                                                                                   '+
      '\n                                                                                   '+
      '\n    dhBoilerplate made with love & help.                                           '+
      '\n    ---------------------------------------                                        '+
      '\n    Author   :   David Hellmann                                                    '+
      '\n    Website  :   http://davidhellmann.com                                          '+
      '\n    Github   :   https://github.com/davidhellmann/generator-dhBoilerplate          '+
      '\n                                                                                   '+
      '\n ————————————————————————————————————————————————————————————————————————————————— ';

    console.log(welcome);

    var prompts = [
      {
        type:    'input',
        name:    'projectName',
        message: 'Please give your project a name (without Spaces)',
        default: 'dhBoilerplate'
      }, {
        type:    'input',
        name:    'projectDescription',
        message: 'Short description of the Project',
        default: 'undefined'
      }, {
        type: 'confirm',
        name: 'projectIECompatible',
        message: 'IE8 compatibility needed?',
        default: false
      },{
        type:    'list',
        name:    'projectUsage',
        message: 'Which purpose does this Project have? Choose the appropriate option',
        choices: [
          "Prototyping",
          "WordPress",
          "CraftCMS"
        ]
      }, {
        type: 'confirm',
        name: 'projectjQuery',
        message: 'Include new (2.1.4 => y) or Old (1.11.3 => n) jQuery Version?',
        default: true
      }, {
        type:    'input',
        name:    'projectVersion',
        message: 'Project Version Number',
        default: '0.0.1'
      }, {
        type:    'input',
        name:    'projectAuthor',
        message: 'Project Author or company',
        default: 'undefined'
      }, {
        type:    'input',
        name:    'projectMail',
        message: 'Mailadress of the author',
        default: 'undefined'
      }, {
        type:    'input',
        name:    'projectUrl',
        message: 'Author URl',
        default: 'http://...'
      }, {
        type:    'input',
        name:    'projectRepo',
        message: 'Git Repo URL',
        default: 'http://...'
      }
    ];

    this.prompt(prompts, function (props) {
      this.projectName          = props.projectName;
      this.projectDescription   = props.projectDescription;
      this.projectIECompatible  = props.projectIECompatible;
      this.projectjQuery        = props.projectjQuery;
      this.projectUsage         = props.projectUsage;
      this.projectVersion       = props.projectVersion;
      this.projectAuthor        = props.projectAuthor;
      this.projectMail          = props.projectMail;
      this.projectUrl           = props.projectUrl;
      this.projectRepo          = props.projectRepo;
      done();
    }.bind(this));

  },

  app: function () {
    // move src folder
    this.directory('___src/_system/',   '___src/_system/');
    this.directory('___src/assets/',    '___src/assets/');
    this.directory('___src/gulp/',      './gulp/');

    if ( this.projectUsage === 'Prototyping' ) {
      this.directory('___src/templates/prototyping/', '___src/templates/');
    }

    if ( this.projectUsage === 'WordPress' ) {
      this.directory('___src/templates/wordpress/', '___src/templates/');
    }

    if ( this.projectUsage === 'CraftCMS' ) {
      this.directory('___src/templates/craftcms/', '___src/templates/');
    }
  },

  projectfiles: function () {
    this.copy('_package.json',          'package.json');
    this.copy('_config.json',           'config.json');
    this.copy('_gulpfile.babel.js',     'gulpfile.babel.js');
    this.copy('_readme.md',             'readme.md');
    this.copy('_gitignore',             '.gitignore');
    this.copy('editorconfig',           '.editorconfig');
    this.copy('jshintrc',               '.jshintrc');
    this.copy('babelrc',                '.babelrc');
  },

  install: function () {
    console.log('Install NPM Modules.');
    console.log('Give me a moment to do that…');
    this.installDependencies({
      bower: false,
      npm: true
    });
  }

});

module.exports = dhBoilerplateGenerator;
