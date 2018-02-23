import { combineReducers } from 'redux';
import AuthenticationReducer from './AuthenticationReducer';
import ProductFormReducer from './ProductFormReducer';
import ProductReducer from './ProductReducer';

export default combineReducers({
  authentication: AuthenticationReducer,
  productForm: ProductFormReducer,
  products: ProductReducer 
});