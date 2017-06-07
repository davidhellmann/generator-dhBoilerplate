import pkg from '../../package.json'

const postCssConfig = () => {
    return [
        // Include Assets
        require('postcss-assets')({
            basePath: pkg.dist.markup,
            loadPaths: [pkg.dist.images.base]
        }),

        require('postcss-normalize')({ /* options */ }),

        // Prefixer
        require('autoprefixer')({
            cascade: false
        }),

        // Inline SVG Images
        require('postcss-svg')({
            defaults: '[fill]:#f00',
            paths: [pkg.dist.images.svg.single]
        }),

        // Include Size Short hands
        require('postcss-short-size'),

        // Fix some Flexbox Bugs
        require('postcss-flexbugs-fixes'),
        require('postcss-responsive-type')
    ]
}

module.exports = postCssConfig
