import React from 'react';
import { Scene, Router, Actions } from 'react-native-router-flux';
import LoginScreen from './screens/LoginScreen';
import EmployeesScreen from './screens/EmployeesScreen';
import CreateEmployeeScreen from './screens/CreateEmployeeScreen';

const RouterComponent = () => {
	return (
		<Router>
			<Scene key="root" hideNavBar>
				<Scene key="authFlow">
					<Scene key="loginScreen" component={LoginScreen} title="Please Login" />
				</Scene>

				<Scene key="mainFlow">
					<Scene 
					rightTitle = "Add"
					onRight={() => { Actions.createEmployeeScreen() }}
					key="employeesScreen" 
					component={EmployeesScreen}
					title="Employees"
					initial
					/>
					<Scene key="createEmployeeScreen" component={CreateEmployeeScreen} title="Create Employee" />
				</Scene>
			</Scene>
		</Router>
	);
};

export default RouterComponent;