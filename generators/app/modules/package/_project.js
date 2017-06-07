const extend = require('deep-extend')

function addProjectSettings(files = {}, context) {
    extend(files.pkg, {
        projectName: context.props.projectName,
        projectDescription: context.props.projectDescription,
        proxy: context.props.projectProxy,
        projectType: context.props.projectType,
        projectVresion: context.props.projectVersion
    })
}

module.exports = addProjectSettings
