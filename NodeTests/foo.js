//----------------------------------------
var buf_0 = new Buffer('my buffer content');
console.log(buf_0[10]);
console.log('--------------------');

//----------------------------------------
var buf_1 = new Buffer("manamana tutu tururu");
var smallerBuffer = buf_1.slice(0, 8);
console.log(buf_1.toString());
console.log(smallerBuffer.toString());
console.log('--------------------');

buf_1 = "minimini"
console.log(buf_1.toString());
console.log(smallerBuffer.toString());
console.log('--------------------');

//----------------------------------------
var oneSecond = 1000;
var twoSeconds = 2000;
var tenSeconds = 10000;

var timeout = setTimeout(function A() {
// 'Print after one second' is never printed
// because there is a clearTimeout in function B
// called before function A 
	console.log('Print after one second');
}, twoSeconds);
console.log('----->-------->-------');

setTimeout(function B() {
	clearTimeout(timeout);
}, oneSecond);

//----------------------------------------
var x = 0;
var interval = setInterval(function C(){
	x = x + 2;
	console.log('%s - Print every two seconds for 10 seconds', x);
}, twoSeconds);
console.log('----<---------<-------');

setTimeout(function C() {
	clearInterval(interval);
}, tenSeconds);