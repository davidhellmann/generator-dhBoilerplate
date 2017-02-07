
var textareas = '#settings-matrixBlockColors td:nth-child(2) textarea';

// On load, colorize cells
$(function () {
	var $cells = $(textareas);
	$cells.each(function () {
		changeColor($(this));
	});
});

// Listen for changes
$(document).on('keyup', textareas, function () {
	changeColor($(this));
});

// Change table cell color
function changeColor(el) {
	el.css({'background-color': el.val()});
}