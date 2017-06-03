/*--------------------------------------------------
    Set Listener noTouch, Touch.
  --------------------------------------------------*/

const setListener = (listener) => {
  const getListener = listener.split(' ')
  let newEvent

  if (Modernizr.touchevents) {
    newEvent = getListener[1]
  } else {
    newEvent = getListener[0]
  }
  return newEvent
}

export { setListener as setListener }
