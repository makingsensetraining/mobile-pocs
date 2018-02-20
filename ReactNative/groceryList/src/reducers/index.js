import { combineReducers } from 'redux';
import AuthenticationReducer from './AuthenticationReducer';

export default combineReducers({
	authentication: AuthenticationReducer
});