const MovingObject = require("./moving_object.js");
const Asteroid = require("./asteroid.js");
const Util = require('./utils');
const Game = require('./game');
const GameView = require('./game_view');

window.MovingObject = MovingObject;
window.Asteroid = Asteroid;
window.Util = Util;
window.Game = Game;


document.addEventListener('DOMContentLoaded', () => {
  console.log('hi from index.js');
  const canvas = document.getElementById('game-canvas');
  const ctx = canvas.getContext('2d');
  new GameView(ctx);

});


