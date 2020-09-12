// Function.prototype.inherits = function(superclass) {
//     function Surrogate() {}
//     Surrogate.prototype = superclass.prototype;
//     this.prototype = new Surrogate();
//     this.prototype.constructor = this;
// };

Asteroid.prototype = Object.create(MovingObject.prototype);
Ship.prototype = Object.create(MovingObject.prototype);

function MovingObject (name,speed) {
    this.name = name;
    this.speed = speed;
}

MovingObject.prototype.sayName = function() {
    console.log(`Hi, my name is ${this.name}`);
};


Asteroid.prototype.hitsEarth = function() {
    console.log(`Dang, there it goes`);
};

function Ship (color) {
    this.color = color;
    this.name = "Joanna";
}


function Asteroid (name, speed) {
    MovingObject.call(this, name, speed);
}


venus = new Ship("yellow");

venus.sayName();
// venus.hitsEarth();

const xion = new Asteroid("Griselda", "Very fast");


xion.sayName();
xion.hitsEarth();