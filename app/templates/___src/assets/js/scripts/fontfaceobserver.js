import FontFaceObserver from 'fontfaceobserver'

// Disable if you use WebFonts
document.documentElement.className += " wf-loaded"

/*
const fontA = new FontFaceObserver('fontA')
const fontB = new FontFaceObserver('fontB')

fontA.load().then(function () {
 document.documentElement.className += " wf-loaded"
 })

Promise.all([fontA.load(), fontB.load()]).then(function () {
    document.documentElement.className += " wf-loaded"
});
*/
