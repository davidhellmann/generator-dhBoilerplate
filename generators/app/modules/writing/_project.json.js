const extend = require('deep-extend')

function projectJson(files = {}) {
    extend(files.pkg, {
        "projectName": this.props.projectName,
        "projectDescription": this.props.projectDescription,
        "proxy": this.props.projectProxy,
        "projectType": this.props.projectType,
        "projectVresion": this.props.projectVersion
    })
}

module.exports = projectJson
