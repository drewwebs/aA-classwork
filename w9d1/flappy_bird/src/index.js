import FlappyBird from './game';

const canvas = document.getElementById('bird-game');
const FirstGame = new FlappyBird(canvas);

FirstGame.restart();
