import { connect } from 'react-redux';
import TodoList from './todo_list';
import { allTodos } from '../../reducers/selectors';
import { receiveTodo } from '../../actions/todo_actions';

const mapStateToProps = (state) => ({
  todos: allTodos(state),
});

const mapDispatchToProps = (dispatch) => ({
  receiveTodo: (todo) => dispatch(receiveTodo(todo)),
});

const toDoListContainer = connect(mapStateToProps, mapDispatchToProps);

export default toDoListContainer(TodoList);