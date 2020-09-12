function MovingObject(options) {
  this.pos = options.pos;
  this.vel = options.vel;
  this.radius = options.radius;
  this.color = options.color;
  this.game = options.game;
}

MovingObject.prototype.draw = function (ctx) {
  ctx.beginPath();
  ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI);
  ctx.fillStyle = this.color;
  ctx.fill();
  ctx.closePath();
}

MovingObject.prototype.move = function() {
  this.pos[0] += this.vel[0];
  this.pos[1] += this.vel[1];

  if (this.pos[0] > 900 || this.pos[0] < 0 || this.pos[1] > 900 || this.pos[1] < 0) {
    this.pos = this.game.wrap(this.pos);
  }
  // console.log(this.game.wrap(this.pos));
};

MovingObject.prototype.isCollidedWith = function(otherObject) {
  if (this !== otherObject) {
    DX = this.pos[0] - otherObject.pos[0];
    DY = this.pos[1] - otherObject.pos[1];
    distanceBetween = Math.sqrt(DX**2 + DY**2)
    radiusSum = this.radius + otherObject.radius

    if (radiusSum > distanceBetween) return true
  }
// been nice towork with u brro!
// Yeah man, nice work!  We made a painting =) and found big o is important :D  and we are not good at it XD lol
// aight cya later man : ))
// peace peace
}

module.exports = MovingObject;