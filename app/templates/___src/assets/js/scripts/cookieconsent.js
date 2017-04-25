import 'cookieconsent'

window.addEventListener("load", function() {
    window.cookieconsent.initialise({
        "theme": "classic",
        "position": "top",
        "content": {
            "message": "Diese Website verwendet Cookies. Weitere Informationen zu Cookies finden Sie unter ",
            "dismiss": "OK",
            "link": "Datenschutz",
            "href": "https://REPLACE_ME.REPLACE_ME/datenschutz"
        }
    })
});
