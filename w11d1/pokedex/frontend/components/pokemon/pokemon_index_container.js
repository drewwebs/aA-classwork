import { connect } from 'react-redux';
import { requestAllPokemon } from '../../actions/pokemon_actions';
import { selectAllPokemon } from '../../reducers/selectors';
import PokemonIndex from './pokemon_index';

const mSTP = state => {
    return { pokemon: selectAllPokemon(state) };
};

const mDTP = dispatch => {
    return {
        requestAllPokemon: () => { return dispatch(requestAllPokemon())} //we return here because we can then chain .thens 
    };
};

export default connect(mSTP, mDTP)(PokemonIndex);