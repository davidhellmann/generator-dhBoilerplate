//  --------------------------------------------------------
//  Cookies
//  --------------------------------------------------------


// Create cookie
const createCookie = (name, value, days) => {
    let expires
    if (days) {
        const date = new Date()
        date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000))
        expires = `; expires= ${date.toGMTString()}`
    } else {
        expires = ''
    }
    document.cookie = `${name} = ${value} ${expires} ; path=/`
}

export { createCookie as createCookie }


// Read cookie
const readCookie = (name) => {
    const nameEQ = `${name}=`
    const ca = document.cookie.split(';')
    for (let i = 0; i < ca.length; i += 1) {
        let c = ca[i]
        while (c.charAt(0) === ' ') {
            c = c.substring(1, c.length)
        }
        if (c.indexOf(nameEQ) === 0) {
            return c.substring(nameEQ.length, c.length)
        }
    }
    return null
}

export { readCookie as readCookie }


// Delete Cookie
const deleteCookie = (name) => {
    createCookie(name, '', -1)
}

export { deleteCookie as deleteCookie }
