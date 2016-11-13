//  --------------------------------------------------------
//  Add Multiple Event Listener
//  --------------------------------------------------------

function addListenerMulti(el, s, fn) {
    s.split(' ').forEach(e => el.addEventListener(e, fn, false))
}

export default addListenerMulti
