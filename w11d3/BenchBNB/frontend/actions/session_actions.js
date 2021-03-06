import * as APIutil from './util/session_api_util';

export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER';
export const LOGOUT_CURRENT_USER = 'LOGOUT_CURRENT_USER';
export const RECEIVE_ERRORS = 'RECEIVE_ERRORS';

const receiveCurrentUser = user => ({
    type: RECEIVE_CURRENT_USER,
    user
})

const logoutCurrentUser = () => ({
    type: LOGOUT_CURRENT_USER
})

const receiveErrors = (errors) => ({
    type: RECEIVE_ERRORS,
    errors
})


export const login = user => dispatch => APIutil.login(user)
.then(user => dispatch(receiveCurrentUser(user)))

export const logout = () => dispatch => APIutil.logout()
.then( () => dispatch(logoutCurrentUser()))

export const signup = user => dispatch => APIutil.signup()
.then( user => dispatch(receiveCurrentUser(user)))

