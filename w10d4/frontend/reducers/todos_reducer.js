import { RECEIVE_TODOS, RECEIVE_TODO } from '../actions/todo_actions';


const _initialState = {
  1: {
    id: 1,
    title: "wash car",
    body: "with soap",
    done: false,
  },
  2: {
    id: 2,
    title: "wash dog",
    body: "with shampoo",
    done: true,
  },
};


const todosReducer = (state = _initialState, action) => {
    Object.freeze(state);

    

    switch (action.type) {
        case RECEIVE_TODOS: 

            const newTodos = {};
            action.todos.forEach(todo => {
                newTodos[todo.id] = todo;
            })

            return newTodos;
        case RECEIVE_TODO:


            const newState = Object.assign({}, state, {[action.todo.id]: action.todo});
            return newState;
        default:
            return state; 
    }
};


export default todosReducer;
