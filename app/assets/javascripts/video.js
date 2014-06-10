
navigator.getUserMedia = navigator.getUserMedia ||
                         navigator.webkitGetUserMedia ||
                         navigator.mozGetUserMedia ||
                         navigator.msGetUserMedia;

if(navigator.getUserMedia){
  navigator.getUserMedia({video:true},function(stream){
    video.src = window.URL.createObjectURL(stream);
  }, function(){alert("error loading the camera")});
  } else {
    video.src ='somevideo.webm'; // fallback.
  }
