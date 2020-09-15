// import { receiveAllPokemon, requestAllPokemon } from './actions/pokemon_actions';
// import * as APIUtil from './util/api_util';
// import { selectAllPokemon } from './reducers/selectors';

import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';
// import { HashRouter, Route } from "react-router-dom";

document.addEventListener('DOMContentLoaded', () => {
    const store = configureStore();
    const root = document.getElementById('root');
    ReactDOM.render(<Root store={store} />, root);
});