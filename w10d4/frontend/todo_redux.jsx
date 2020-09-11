import React from 'react';
import ReactDOM from 'react-dom';
import Todo from './components/todo';
import App from './components/app';
import Root from './components/root';
import configureStore from './store/store';
import { receiveTodo, receiveTodos } from './actions/todo_actions.js';
import { allTodos } from './reducers/selectors';

const store = configureStore();



window.store = store;
window.receiveTodo = receiveTodo;
window.receiveTodos = receiveTodos;
window.allTodos = allTodos(store.getState());


document.addEventListener("DOMContentLoaded", () => {
    const root = document.getElementById("root");
    
    ReactDOM.render(<Root store={store} />, root);
});


