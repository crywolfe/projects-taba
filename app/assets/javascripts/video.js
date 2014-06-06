
navigator.getUserMedia = navigator.getUserMedia ||
                         navigator.webkitGetUserMedia ||
                         navigator.mozGetUserMedia ||
                         navigator.msGetUserMedia;

var video = document.querySelector('video');

if(navigator.getUserMedia){
  navigator.getUserMedia({video:true},function(stream){
    video.src = window.URL.createObjectURL(stream);
  }, errorCallback);
  } else {
    video.src ='somevideo.webm'; // fallback.
  }


navigator.getUserMedia = (navigator.getUserMedia ||
                          navigator.webkitGetUserMedia ||
                          navigator.mozGetUserMedia ||
                          navigator.msGetUserMedia);
function MicrophoneSample() {
  this.WIDTH = 240;
  this.HEIGHT = 250;
  this.getMicrophoneInput();
  this.canvas = document.querySelector('canvas');
}

MicrophoneSample.prototype.getMicrophoneInput = function() {
  navigator.getUserMedia({audio: true},
                          this.onStream.bind(this),
                          this.onStreamError.bind(this));
};

MicrophoneSample.prototype.onStream = function(stream) {
  var input = context.createMediaStreamSource(stream);
  var filter = context.createBiquadFilter();
  filter.frequency.value = 60.0;
  filter.type = filter.NOTCH;
  filter.Q = 10.0;

  var analyser = context.createAnalyser();

  // Connect graph.
  input.connect(filter);
  filter.connect(analyser);

  this.analyser = analyser;
  // Setup a timer to visualize some stuff.
  requestAnimFrame(this.visualize.bind(this));
};

MicrophoneSample.prototype.onStreamError = function(e) {
  console.error('Error getting microphone', e);
};

MicrophoneSample.prototype.visualize = function() {
  this.canvas.width = this.WIDTH;
  this.canvas.height = this.HEIGHT;
  var drawContext = this.canvas.getContext('2d');

  var times = new Uint8Array(this.analyser.frequencyBinCount);
  this.analyser.getByteTimeDomainData(times);
  for (var i = 0; i < times.length; i++) {
    var value = times[i];
    var percent = value / 256;
    // var height = this.HEIGHT * percent;
    var newWidth = this.WIDTH * percent;

    // var offset = this.HEIGHT - height;
    var newOffset = this.WIDTH - newWidth;

    // var barWidth = this.WIDTH/times.length;
    var barHeight = this.HEIGHT/times.length;

    drawContext.fillStyle = 'blue';
    // drawContext.fillRect(i * barWidth, offset, 10, 10);
    drawContext.fillRect(newOffset - 15,i * barHeight, 3`0, 5);
  }
  requestAnimFrame(this.visualize.bind(this));
};
