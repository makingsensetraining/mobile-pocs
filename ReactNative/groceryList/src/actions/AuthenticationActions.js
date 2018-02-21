import {
  EMAIL_UPDATE,
  PASSWORD_UPDATE,
  LOGIN_START,
  LOGIN_SUCCEED,
  LOGIN_FAIL
} from './types';
import * as firebase from 'firebase';

export const emailUpdate = (email) => {
  return {
    type: EMAIL_UPDATE,
    payload: email
  };
};

export const passwordUpdate = (password) => {
  return {
    type: PASSWORD_UPDATE,
    payload: password
  };
};

export const performLogin = ({email, password}) => {
  return (dispatch) => {
    dispatch( { type: LOGIN_START } );

    firebase.auth().signInWithEmailAndPassword(email, password)
    .then(() => loginSuccess(dispatch))
    .catch(() => firebase.auth().createUserWithEmailAndPassword(email, password)
      .then(() => loginSuccess(dispatch))
      .catch(() => loginFail(dispatch))
    );
  };
};

const loginSuccess = (dispatch) => {
  dispatch({ type: LOGIN_SUCCEED });

};

const loginFail = (dispatch) => {
  dispatch({ type: LOGIN_FAIL });
};
