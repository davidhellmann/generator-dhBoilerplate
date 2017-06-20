const filesModuleTpl = (context) => {
    return {
        files: [
            {
                src: `___src/example/_main.js`,
                dest: `./${context.props.moduleName}/_main.js`,
                type: 'js'
            },
            {
                src: `___src/example/_style.scss`,
                dest: `./${context.props.moduleName}/_style.scss`,
                type: 'css'
            },
            {
                src: `___src/example/_template.html`,
                dest: `./${context.props.moduleName}/_template${context.props.templateExtension}`,
                type: 'template'
            }
        ]
    }
}

module.exports = filesModuleTpl
