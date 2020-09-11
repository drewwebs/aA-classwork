import React from 'react';
import allTodos from '../../reducers/selectors';

export default () => (

    <>
    <h3>Todo List goes here!</h3>
        <ul>
            
            <li todos={allTodos.forEach(todo.title)}>{todo}</li>
        </ul>
    </>);

