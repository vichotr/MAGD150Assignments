function preload() {
  soundFormats('mp3', 'ogg', 'wav');
  mySound = loadSound('doorbell.wav');
}

function setup() {
  mySound.setVolume(0.1);
  mySound.play();
}