import React from 'react';
import { Link, NavLink } from 'react-router-dom';

const PokemonIndexItem = (props) => {
    const pokemon = props.pokemon;
    return (
      <li>
        <NavLink to={`/pokemon/${pokemon.id}`}>
          <img src={pokemon.image_url} width="20px" height="20px"></img>{" "}
          {pokemon.name}
        </NavLink>
      </li>
    );
};

export default PokemonIndexItem;