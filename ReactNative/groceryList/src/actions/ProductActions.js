import firebase from 'firebase';
import { Actions } from 'react-native-router-flux';
import {
	PRODUCT_UPDATE,
	PRODUCT_CREATE
} from './types';

export const productUpdate = ({ prop, value}) => {
	return {
		type: PRODUCT_UPDATE,
		payload: { prop, value}
	};
};

export const productCreate = ({ name, count, brand }) => {
  const { currentUser } = firebase.auth();

  return (dispatch) => {
    firebase.database().ref(`/users/${currentUser.uid}/products`)
		.push({name, count, brand })
		.then(() => {
			dispatch({ type: PRODUCT_CREATE});
			Actions.pop()
		});
  };
};