/**
 * Set Body Classes
 */

const body     = document.body;
const steps    = 100;
const duration = 3000;

let timer    = 0;
let i        = 1;


while (timer <= duration) {

    if (timer == 0) {

        body.classList.add('is_ready');

    } else {

        setTimeout(function() {

            body.classList.add('is_now_' + (i * steps));
            i++;

        }, timer);

    }

    timer = timer  + steps;
}
