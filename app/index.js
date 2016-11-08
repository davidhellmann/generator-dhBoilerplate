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

        return this.prompt([
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
                type:    'input',
                name:    'proxyUrl',
                message: 'Proxy URL',
                default: false
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
                    "Craft CMS"
                ]
            },{
                when: function(answers) {
                    return answers.projectUsage === 'Craft CMS';
                },
                type: 'confirm',
                name: 'craftHearty',
                message: 'Do you want to use Hearty Config?',
                default: true
            },{
                when: function(answers) {
                    return answers.projectUsage === 'Craft CMS';
                },
                type: 'confirm',
                name: 'craftImager',
                message: 'Do you want to use Imager?',
                default: true
            },{
                when: function(answers) {
                    return answers.projectUsage === 'Craft CMS';
                },
                type: 'confirm',
                name: 'craftMultilang',
                message: 'Do you want to use Multilang Config?',
                default: false
            },{
                type: 'confirm',
                name: 'projectjQuery',
                message: 'Include new (3.x.x => y) or Old (1.11.3 => n) jQuery Version?',
                default: true
            }, {
                type: 'confirm',
                name: 'projectVue',
                message: 'Do you want to use Vue.js?',
                default: false
            }, {
                type: 'confirm',
                name: 'projectYarn',
                message: 'Do you want to use Yarn Package Manager? (https://yarnpkg.com/)',
                default: false
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
                message: 'Author URL',
                default: 'http://...'
            }, {
                type:    'input',
                name:    'projectRepo',
                message: 'Git Repo URL',
                default: 'http://...'
            }
        ]).then(function(answers) {
            function checkAnswer(answer) {
                if(answer) {
                    return answer
                } else {
                    return false
                }
            }
            this.projectName          = answers.projectName;
            this.projectDescription   = answers.projectDescription;
            this.proxyUrl             = answers.proxyUrl;
            this.projectIECompatible  = answers.projectIECompatible;
            this.projectjQuery        = answers.projectjQuery;
            this.projectVue           = answers.projectVue;
            this.projectUsage         = answers.projectUsage;
            this.craftHearty          = checkAnswer(answers.craftHearty);
            this.craftImager          = checkAnswer(answers.craftImager);
            this.craftMultilang       = checkAnswer(answers.craftMultilang);
            this.projectVersion       = answers.projectVersion;
            this.projectAuthor        = answers.projectAuthor;
            this.projectMail          = answers.projectMail;
            this.projectUrl           = answers.projectUrl;
            this.projectRepo          = answers.projectRepo;
            this.projectYarn          = answers.projectYarn;
            done();
        }.bind(this));

    },

    app: function () {

        // move src folder
        this.directory('___src/_system/',   '___src/_system/');
        this.directory('___src/_data/',   '___src/_data/');
        this.directory('___src/assets/',    '___src/assets/');
        this.directory('___src/gulp/',      './gulp/');

        if ( this.projectUsage === 'Prototyping' ) {
            this.directory('___src/templates/prototyping/', '___src/templates/');
        }

        if ( this.projectUsage === 'WordPress' ) {
            this.directory('___src/templates/wordpress/', '___src/templates/');
        }

        if ( this.projectUsage === 'Craft CMS' ) {

            if (this.craftHearty) {
                var craftPath = '';
            } else {
                var craftPath = 'craft';
            }

            // Copy Templates
            this.directory('___src/templates/craftcms/', '___src/templates/');


            // Copy Imager Config
            this.fs.copyTpl(
                this.templatePath('___src/_craft/imager/imager.php'),
                this.destinationPath('___dist/'+ craftPath +'/config/imager.php')
            );


            // Copy Craft CLI
            this.fs.copyTpl(
                this.templatePath('___src/_craft/.craft-cli.php'),
                this.destinationPath('.craft-cli.php')
            );


            // Copy Plugins
            this.directory('___src/_craft/plugins/', '___dist/'+ craftPath +'/plugins');


            // Copy Translations
            if(this.craftMultilang) {
                this.directory('___src/_craft/translations/', '___dist/'+ craftPath+ '/translations');
            }


            // Copy Hearty Config
            if(this.craftHearty) {
                this.directory('___src/_craft/hearty/config/', '___dist/config');
            }

        }
    },

    projectfiles: function () {
        var params = {
            projectName:          this.projectName,
            projectDescription:   this.projectDescription,
            proxyUrl:             this.proxyUrl,
            projectIECompatible:  this.projectIECompatible,
            projectjQuery:        this.projectjQuery,
            projectVue:           this.projectVue,
            projectUsage:         this.projectUsage,
            craftHearty:          this.craftHearty,
            craftImager:          this.craftImager,
            craftMultilang:       this.craftMultilang,
            projectVersion:       this.projectVersion,
            projectAuthor:        this.projectAuthor,
            projectMail:          this.projectMail,
            projectUrl:           this.projectUrl,
            projectRepo:          this.projectRepo,
            projectYarn:          this.projectYarn
        }


        this.fs.copyTpl(
            this.templatePath('_package.json'),
            this.destinationPath('package.json'),
            params
        );

        this.fs.copyTpl(
            this.templatePath('_config.json'),
            this.destinationPath('config.json'),
            params
        );

        this.fs.copyTpl(
            this.templatePath('_gulpfile.babel.js'),
            this.destinationPath('gulpfile.babel.js'),
            params
        );

        this.fs.copyTpl(
            this.templatePath('_readme.md'),
            this.destinationPath('readme.md'),
            params
        );

        this.fs.copyTpl(
            this.templatePath('_gitignore'),
            this.destinationPath('.gitignore'),
            params
        );

        this.fs.copyTpl(
            this.templatePath('editorconfig'),
            this.destinationPath('.editorconfig'),
            params
        );

        this.fs.copyTpl(
            this.templatePath('jshintrc'),
            this.destinationPath('.jshintrc'),
            params
        );

        this.fs.copyTpl(
            this.templatePath('eslintrc'),
            this.destinationPath('.eslintrc'),
            params
        );

        this.fs.copyTpl(
            this.templatePath('babelrc'),
            this.destinationPath('.babelrc'),
            params
        );
    },

    install: function () {
        if (this.projectYarn) {
            this.spawnCommand('yarn');
        } else {
            this.installDependencies({
                bower: false,
                npm: true
            });
        };
        this.log('Install NPM Modules.');
        this.log('Give me a moment to do that…');
    }

});

module.exports = dhBoilerplateGenerator;
