const extend = require('deep-extend')

function addBaseData(files = {}) {
    extend(files.pkg, {
        name: this.props.projectName,
        description: this.props.projectDescription,
        version: this.props.projectVersion,
        authors: [
            {
                name: this.props.authorName,
                email: this.props.authorEmail,
                homepage: this.props.authorHomepage
            }
        ],
        repository: ''
    })
}

module.exports = addBaseData
