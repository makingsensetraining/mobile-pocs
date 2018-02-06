import React from 'react';
import PropTypes from 'prop-types';
import { connect } from 'react-redux';
import { addNavigationHelpers, StackNavigator } from 'react-navigation';
import { Button } from 'react-native';
import LoginScreen from '../screens/LoginScreen';
import EmployeesScreen from '../screens/EmployeesScreen';
import CreateEmployeeScreen from '../screens/CreateEmployeeScreen';
import EditEmployeeScreen from '../screens/EditEmployeeScreen';

export const MainNavigator = StackNavigator({
  Login: {
    screen: LoginScreen,
    navigationOptions: {
      title: 'Please Login'
    }
  },
  Employees: {
    screen: EmployeesScreen,
    navigationOptions: ({ navigation }) => ({
      title: 'Employees',
      headerRight: <Button title='Add' onPress={() => navigation.navigate('CreateEmployee') } />,
    }),
  },
  CreateEmployee: {
    screen: CreateEmployeeScreen,
    navigationOptions: {
      title: 'New employee',
    },
  },
  EditEmployee: {
    screen: EditEmployeeScreen,
    navigationOptions: ({ navigation }) => ({
      title: `${navigation.state.params.name}`,
    }),
  },
});

const AppWithNavigationState = ({ dispatch, nav }) => (
  <MainNavigator navigation={addNavigationHelpers({ dispatch, state: nav })} />
);

AppWithNavigationState.propTypes = {
  dispatch: PropTypes.func.isRequired,
  nav: PropTypes.object.isRequired,
};

const mapStateToProps = state => ({
  nav: state.nav,
});

export default connect(mapStateToProps)(AppWithNavigationState);
