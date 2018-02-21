import {
  EMAIL_UPDATE,
  PASSWORD_UPDATE,
  LOGIN_START,
  LOGIN_SUCCEED,
  LOGIN_FAIL
} from '../actions/types';

const INITIAL_STATE = {
  email: '',
  password: '',
  loading: false,
  error: '',
};

export default (state = INITIAL_STATE, action) => {

  switch (action.type) {
    case EMAIL_UPDATE:
      return { ...state, email: action.payload };
    case PASSWORD_UPDATE:
      return { ...state, password: action.payload };
    case LOGIN_START:
      return { ...state, loading: true };
    case LOGIN_SUCCEED:
      return INITIAL_STATE;
    case LOGIN_FAIL:
      return { ...INITIAL_STATE, email: state.email, error: 'Authentication failed.' };
    default:
      return state;
  }
};
