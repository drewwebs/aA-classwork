import { combineReducers } from 'redux';
import pokemonReducer from './pokemon_reducer';
import itemsReducers from './items_reducer';

const entitiesReducer = combineReducers({
  pokemon: pokemonReducer,
  items: itemReducer
});

export default entitiesReducer;