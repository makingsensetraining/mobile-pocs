import {
  EMPLOYEES_FETCH,
  EMPLOYEE_UPDATE,
  EMPLOYEE_SAVE,
  EMPLOYEE_DELETE
} from './types';
import * as firebase from 'firebase';
import { NavigationActions } from 'react-navigation';

export const employeesFetch = (dispatch) => {
  const { currentUser } = firebase.auth();

  return dispatch => {
    firebase.database().ref(`/users/${currentUser.uid}/employees`)
        .on('value', snapshot => {
        dispatch({
          type: EMPLOYEES_FETCH,
          payload: snapshot.val()
        });
      });
  }
};

export const employeeUpdate = ({ key, value }) => {
  return {
    type: EMPLOYEE_UPDATE,
    payload: { key, value }
  };
};

export const employeeCreate = ({ name, phone, shift }) => {
  const { currentUser } = firebase.auth();

  return dispatch => {
    firebase.database().ref(`/users/${currentUser.uid}/employees`)
      .push({name, phone, shift})
      .then(dispatch(NavigationActions.back()))
  }
}

export const employeeEdit = ({ uid, name, phone, shift }) => {
  const { currentUser } = firebase.auth();

  return dispatch => {
    firebase.database().ref(`/users/${currentUser.uid}/employees/${uid}`)
      .set({ name, phone, shift })
      .then(dispatch(NavigationActions.back()))
  }
}

export const employeeDelete = ({ uid }) => {
  const { currentUser } = firebase.auth();

  return dispatch => {
    firebase.database().ref(`/users/${currentUser.uid}/employees/${uid}`)
      .remove()
      .then(dispatch(NavigationActions.back()))
  }
}
