const Asteroid = require('./asteroid');

function Game() {
    this.DIM_X = 900;
    this.DIM_Y = 900;
    this.NUM_ASTEROIDS = 10;
    this.asteroids = []

    for (let i = this.NUM_ASTEROIDS; i > 0; i--) {
      this.addAsteroids();
    }
}

Game.prototype.addAsteroids = function() {
  this.asteroids.push(new Asteroid(this.randomPosition(), this));
}

Game.prototype.randomPosition = function() {
  const x = Math.floor(Math.random() * this.DIM_X);
  const y = Math.floor(Math.random() * this.DIM_Y);

  return [x, y]
}

Game.prototype.draw = function(ctx) {
  ctx.clearRect(0,0, this.DIM_X, this.DIM_Y);

  this.asteroids.forEach(asteroid => {
    asteroid.draw(ctx);
  });
}

Game.prototype.moveObjects = function() {
  this.asteroids.forEach(asteroid => {
    asteroid.move();
  })
}

Game.prototype.wrap = function(pos) {
  return [this.DIM_X - pos[0], this.DIM_Y - pos[1]];
}

// [55, 120] => [845, 780]


module.exports = Game;