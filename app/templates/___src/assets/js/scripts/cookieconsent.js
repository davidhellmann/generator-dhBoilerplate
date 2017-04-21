import 'cookieconsent'

window.addEventListener("load", function() {
    window.cookieconsent.initialise({
        "theme": "classic",
        "position": "top",
        "content": {
            "message": "Tp3 verwendet Cookies. Weitere Informationen zu Cookies finden Sie unter ",
            "dismiss": "Ich stimme zu",
            "link": "Datenschutz",
            "href": "https://tp3.at/datenschutz"
        }
    })
});
