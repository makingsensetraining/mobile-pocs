import React, { Component, } from 'react';
import { View, Button } from 'react-native';
import { Provider } from 'react-redux';
import * as firebase from 'firebase';
import store from './store';
import AppWithNavigationState from './navigators/MainNavigator'

class App extends Component {

  componentWillMount() {
    // Initialize Firebase
    var config = {
      apiKey: 'AIzaSyAqF_Csx-W206zNpOS497qEisWb_rBzBO4',
      authDomain: 'auth-332d1.firebaseapp.com',
      databaseURL: 'https://auth-332d1.firebaseio.com',
      projectId: 'auth-332d1',
      storageBucket: 'auth-332d1.appspot.com',
      messagingSenderId: '855775077199'
    };
    firebase.initializeApp(config);
  }

  render() {
    return (
      <Provider store={store}>
        <View style={{flex:1, backgroundColor:'#fff'}}>
          <AppWithNavigationState />
        </View>
      </Provider>
    );
  }
};

export default App;
