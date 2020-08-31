import Level from './level';

export default class FlappyBird {
  constructor(canvas){
    this.ctx = canvas.getContext("2d");
    this.dimensions = { width: canvas.width, height: canvas.height };
  }
}

FlappyBird.prototype.animate = function () {
  Level.animate();
  // Level.advanceState();
  // Level.clearScreen();
  // Level.drawEverything();
  // requestAnimationFrame(animate);
};

// requestAnimationFrame(animate);

FlappyBird.prototype.restart = function () {
  const that = this;
  this.level = new Level(that.dimensions);
  this.animate();
};
