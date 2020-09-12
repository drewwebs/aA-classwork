const MovingObject = require("./moving_object.js");
const Util = require('./utils');

Asteroid.COLOR = "orange";
Asteroid.RADIUS = "20";

function Asteroid(pos, game) {
    MovingObject.call(this, {pos: pos, color: Asteroid.COLOR, radius: Asteroid.RADIUS, vel: Util.randomVec(4), game: game});
}

Util.inherits(Asteroid, MovingObject);


module.exports = Asteroid;