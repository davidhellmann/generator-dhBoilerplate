/**
 * Set Body Classes
 */

var _body     = document.querySelector('body'),
    _steps    = 1000,
    _duration = 3000,
    _timer    = 0,
    _i        = 1;


while (_timer <= _duration) {

  if (_timer == 0) {

    _body.classList.add('is_ready');

  } else {

    setTimeout(function() {

      _body.classList.add('is_now_' + (_i * _steps));
      _i++;

    }, _timer);

  }

  _timer = _timer  + _steps;
}
