import firebase from 'firebase';
import { Actions } from 'react-native-router-flux';
import {
	PRODUCT_UPDATE,
	PRODUCT_CREATE,
	PRODUCTS_FETCH_SUCCESS
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

export const productsFetch = () => {
	const { currentUser } = firebase.auth();

	return (dispatch) => {
		firebase.database().ref(`/users/${currentUser.uid}/products`)
			.on('value', snapshot => {
				dispatch({ type: PRODUCTS_FETCH_SUCCESS, payload: snapshot.val() });

		});
	};
};