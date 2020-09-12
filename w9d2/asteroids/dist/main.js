/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Util = __webpack_require__(/*! ./utils */ \"./src/utils.js\");\n\nAsteroid.COLOR = \"orange\";\nAsteroid.RADIUS = \"20\";\n\nfunction Asteroid(pos, game) {\n    MovingObject.call(this, {pos: pos, color: Asteroid.COLOR, radius: Asteroid.RADIUS, vel: Util.randomVec(4), game: game});\n}\n\nUtil.inherits(Asteroid, MovingObject);\n\n\nmodule.exports = Asteroid;\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Asteroid = __webpack_require__(/*! ./asteroid */ \"./src/asteroid.js\");\n\nfunction Game() {\n    this.DIM_X = 900;\n    this.DIM_Y = 900;\n    this.NUM_ASTEROIDS = 10;\n    this.asteroids = []\n\n    for (let i = this.NUM_ASTEROIDS; i > 0; i--) {\n      this.addAsteroids();\n    }\n}\n\nGame.prototype.addAsteroids = function() {\n  this.asteroids.push(new Asteroid(this.randomPosition(), this));\n}\n\nGame.prototype.randomPosition = function() {\n  const x = Math.floor(Math.random() * this.DIM_X);\n  const y = Math.floor(Math.random() * this.DIM_Y);\n\n  return [x, y]\n}\n\nGame.prototype.draw = function(ctx) {\n  ctx.clearRect(0,0, this.DIM_X, this.DIM_Y);\n\n  this.asteroids.forEach(asteroid => {\n    asteroid.draw(ctx);\n  });\n}\n\nGame.prototype.moveObjects = function() {\n  this.asteroids.forEach(asteroid => {\n    asteroid.move();\n  })\n}\n\nGame.prototype.wrap = function(pos) {\n  return [this.DIM_X - pos[0], this.DIM_Y - pos[1]];\n}\n\n// [55, 120] => [845, 780]\n\n\nmodule.exports = Game;\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\");\n\nfunction GameView(ctx) {\n    this.ctx = ctx;\n    this.game = new Game();\n    this.ctx = ctx;\n    this.start();\n}\n\nGameView.prototype.start = function() {\n    setInterval( () => {\n        this.game.moveObjects();\n        this.game.draw(this.ctx);\n    }, 20)\n}\n\n\nmodule.exports =  GameView;\n\n//# sourceURL=webpack:///./src/game_view.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\nconst Util = __webpack_require__(/*! ./utils */ \"./src/utils.js\");\nconst Game = __webpack_require__(/*! ./game */ \"./src/game.js\");\nconst GameView = __webpack_require__(/*! ./game_view */ \"./src/game_view.js\");\n\nwindow.MovingObject = MovingObject;\nwindow.Asteroid = Asteroid;\nwindow.Util = Util;\nwindow.Game = Game;\n\n\ndocument.addEventListener('DOMContentLoaded', () => {\n  console.log('hi from index.js');\n  const canvas = document.getElementById('game-canvas');\n  const ctx = canvas.getContext('2d');\n  new GameView(ctx);\n\n});\n\n\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("function MovingObject(options) {\n  this.pos = options.pos;\n  this.vel = options.vel;\n  this.radius = options.radius;\n  this.color = options.color;\n  this.game = options.game;\n}\n\nMovingObject.prototype.draw = function (ctx) {\n  ctx.beginPath();\n  ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI);\n  ctx.fillStyle = this.color;\n  ctx.fill();\n  ctx.closePath();\n}\n\nMovingObject.prototype.move = function() {\n  this.pos[0] += this.vel[0];\n  this.pos[1] += this.vel[1];\n\n  if (this.pos[0] > 900 || this.pos[0] < 0 || this.pos[1] > 900 || this.pos[1] < 0) {\n    this.pos = this.game.wrap(this.pos);\n  }\n  // console.log(this.game.wrap(this.pos));\n};\n\nMovingObject.prototype.isCollidedWith = function(otherObject) {\n  if (this !== otherObject) {\n    DX = this.pos[0] - otherObject.pos[0];\n    DY = this.pos[1] - otherObject.pos[1];\n    distanceBetween = Math.sqrt(DX**2 + DY**2)\n    radiusSum = this.radius + otherObject.radius\n\n    if (radiusSum > distanceBetween) return true\n  }\n// been nice towork with u brro!\n// Yeah man, nice work!  We made a painting =) and found big o is important :D  and we are not good at it XD lol\n// aight cya later man : ))\n// peace peace\n}\n\nmodule.exports = MovingObject;\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/utils.js":
/*!**********************!*\
  !*** ./src/utils.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("const Util = {\n    inherits(childClass, parentClass) {\n        function Surrogate() {};\n        Surrogate.prototype = parentClass.prototype;\n        childClass.prototype = new Surrogate();\n        childClass.prototype.constructor = childClass; \n    },\n\n    randomVec(length) {\n        const deg = 2 * Math.PI * Math.random();\n            return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n    },\n    // Scale the length of a vector by the given amount.\n    scale(vec, m) {\n        return [vec[0] * m, vec[1] * m];\n    }\n};\n\n\n\nmodule.exports = Util;\n\n//# sourceURL=webpack:///./src/utils.js?");

/***/ })

/******/ });