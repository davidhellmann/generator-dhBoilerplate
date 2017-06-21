const extend = require('deep-extend')

function addVueJS(files = {}) {
    extend(files.pkg, {
        devDependencies: {
            vue: '^2.0.2',
            'vue-resource': '^1.3.1',
            'vue-router': '^2.5.2',
            'browserify-hmr': '^0.3.1',
            'vue-hot-reload-api': '^2.0.8',
            vueify: '^9.4.0'
        },
        dependencies: {
            axios: '^0.15.3'
        },
        browser: {
            vue: 'vue/dist/vue.common'
        }
    })
}

module.exports = addVueJS
