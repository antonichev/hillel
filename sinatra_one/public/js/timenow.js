;
function window.onload() {
	var now = new Date();
	document.getElementById('now').innerHTML = now;
	window.setTimeout(arguments.callee, 1);
}