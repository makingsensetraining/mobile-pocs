import { combineReducers } from 'redux';
import AuthenticationReducer from './AuthenticationReducer';
import ProductFormReducer from './ProductFormReducer';

export default combineReducers({
	authentication: AuthenticationReducer,
	productForm: ProductFormReducer
});