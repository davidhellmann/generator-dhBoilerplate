const extend = require('deep-extend')

function addBaseData(files = {}, context) {
    extend(files.pkg, {
        name: context.props.projectName,
        description: context.props.projectDescription,
        version: context.props.projectVersion,
        authors: [
            {
                name: context.props.authorName,
                email: context.props.authorEmail,
                homepage: context.props.authorHomepage
            }
        ],
        repository: ''
    })
}

module.exports = addBaseData
