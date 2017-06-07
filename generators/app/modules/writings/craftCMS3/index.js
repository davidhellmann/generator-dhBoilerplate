const deleteFiles = require('../../../helpers/files/_deleteFolderRecursive')

const craftFolders = {
    DELETE: [
        '___dist/templates',
        '___dist/config/db.php',
        '___dist/config/general.php',
        '___dist/web/index.php',
        '___dist/craft'
    ]
}

const installCraftCMS3 = () => {
    return {
        download: (context) => {
            return context.spawnCommandSync('composer',
                [
                    'create-project',
                    'craftcms/craft',
                    '___dist', '-s',
                    'beta'
                ])
        },

        writing: (context) => {
            return new Promise((resolve) => {
                // Delete Files Folder we recreate ourself
                deleteFiles({
                    filelist: craftFolders.DELETE,
                    context
                })

                resolve()
            })
        }
    }
}

module.exports = installCraftCMS3
