import { combineReducers } from 'redux';
import AuthenticationReducer from './AuthenticationReducer';
import EmployeesReducer from './EmployeesReducer';
import EmployeeFormReducer from './EmployeeFormReducer';
import { NavigationActions } from 'react-navigation';
import { MainNavigator } from '../navigators/MainNavigator';

// Start with two routes: The Main screen, with the Login screen on top.
const firstAction = MainNavigator.router.getActionForPathAndParams('Login');
const tempNavState = MainNavigator.router.getStateForAction(firstAction);
const secondAction = MainNavigator.router.getActionForPathAndParams('Employees');
const initialNavState = MainNavigator.router.getStateForAction(
  firstAction
);

function nav(state = initialNavState, action) {
  let nextState;
  switch (action.type) {
    case 'Login':
      nextState = MainNavigator.router.getStateForAction(
        NavigationActions.back(),
        state
      );
      break;
    case 'Logout':
      nextState = MainNavigator.router.getStateForAction(
        NavigationActions.navigate({ routeName: 'Login' }),
        state
      );
      break;
    default:
      nextState = MainNavigator.router.getStateForAction(action, state);
      break;
  }

  // Simply return the original `state` if `nextState` is null or undefined.
  return nextState || state;
}

const initialAuthState = { isLoggedIn: false };

function auth(state = initialAuthState, action) {
  switch (action.type) {
    case 'Login':
      return { ...state, isLoggedIn: true };
    case 'Logout':
      return { ...state, isLoggedIn: false };
    default:
      return state;
  }
}

export default combineReducers({
  authentication: AuthenticationReducer,
  employees: EmployeesReducer,
  employeeForm: EmployeeFormReducer,
  nav,
  auth,
});
