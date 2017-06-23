module.exports = {
    files: [
        {
            projectContext: [
                'craftCMS',
                'craftCMS3',
                'prototyping',
                'wordpress'
            ],
            src: '___src/assets/fonts/',
            dest: '___src/assets/fonts/'
        },
        {
            projectContext: [
                'craftCMS',
                'craftCMS3',
                'prototyping',
                'wordpress'
            ],
            src: '___src/assets/images/',
            dest: '___src/assets/images/'
        },
        {
            projectContext: [
                'craftCMS',
                'craftCMS3'
            ],
            src: '___src/_imports/',
            dest: '___src/_imports/'
        },
        {
            projectContext: [
                'craftCMS'
            ],
            src: '___src/_craftCMS/public/uploads/',
            dest: '___dist/public/uploads'
        },
        {
            projectContext: [
                'craftCMS'
            ],
            src: '___src/_craftCMS/plugins/',
            dest: '___dist/craft/plugins'
        },
        {
            projectContext: [
                'craftCMS'
            ],
            src: '___src/_craftCMS/translations/',
            dest: '___dist/craft/translations'
        },
        {
            projectContext: [
                'craftCMS3'
            ],
            src: '___src/_craftCMS3/web/uploads/',
            dest: '___dist/web/uploads'
        },
        {
            projectContext: [
                'prototyping'
            ],
            src: '___src/_data/',
            dest: '___src/_data/'
        },
        {
            projectContext: [
                'craftCMS',
                'craftCMS3',
                'prototyping',
            ],
            src: '___src/scripts/',
            dest: 'scripts/'
        },
    ]
}
