import React from 'react';
import PokemonIndexItem from './pokemon_index_item';

export default class PokemonIndex extends React.Component {

    componentDidMount () {
        this.props.requestAllPokemon();
    }

    render () {
        // debugger;
        const pokemonLis = this.props.pokemon.map( pokemon => {
           return <PokemonIndexItem pokemon={pokemon} key={pokemon.id}/>;
        });

        return <ul>{pokemonLis}</ul>
    }

}