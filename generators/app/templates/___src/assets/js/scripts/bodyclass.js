/**
 * Set Body Classes
 */

const   body      = document.body
const   steps     = 500
const   duration  = 3000
let     timer     = 0
let     i         = 1

const bodyclass = () => {
    body.classList.add(`is_now_${i * steps}`)
    i += i
}


while (timer <= duration) {
    if (timer === 0) {
        body.classList.add('is_ready')
    } else {
        setTimeout(bodyclass, timer)
    }
    timer += steps
}
