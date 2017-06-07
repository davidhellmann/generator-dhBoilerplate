const downloadCraft = require('../../../helpers/files/_downloadFiles')
const deleteFiles = require('../../../helpers/files/_deleteFolderRecursive')

const craftFolders = {
    DELETE: [
        '___dist/craft/templates',
        '___dist/craft/config/db.php',
        '___dist/craft/config/general.php',
        '___dist/public/'
    ]
}

const installCraftCMS = () => {
    return {
        download: (context) => {
            const craftUrl = 'http://buildwithcraft.com/latest.zip?accept_license=yes'
            return downloadCraft({
                url: craftUrl,
                destination: context.destinationPath('./___dist/')
            })
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

module.exports = installCraftCMS
