import React from 'react';
import { Scene, Router, Actions } from 'react-native-router-flux';
import LoginScreen from './screens/LoginScreen';
import ProductsScreen from './screens/ProductsScreen';
import CreateProductScreen from './screens/CreateProductScreen';

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
          onRight={() => { Actions.createProductScreen() }}
          key="productsScreen" 
          component={ProductsScreen}
          title="Products"
          initial
          />
          <Scene key="createProductScreen" component={CreateProductScreen} title="Create Product" />
        </Scene>
      </Scene>
    </Router>
  );
};

export default RouterComponent;