import React, { Component } from 'react';
import { View, Text } from 'react-native';
import { Provider } from 'react-redux';
import { createStore } from 'redux';
import firebase from 'firebase';
import reducers from './reducers';

class App extends Component {

	componentWillMount() {
		const config = {
			apiKey: 'AIzaSyDhmJzDYrO42SDd1LqFRpILfd6k2wvDSm8',
			authDomain: 'grocerylist-3fc84.firebaseapp.com',
			databaseURL: 'https://grocerylist-3fc84.firebaseio.com',
			projectId: 'grocerylist-3fc84',
			storageBucket: 'grocerylist-3fc84.appspot.com',
			messagingSenderId: '1006599893814'
		};
		firebase.initializeApp(config);
	}

	render() {
		return (
			<Provider store={createStore(reducers)}>
				<View>
					<Text>
						Hello!
					</Text>
				</View>
			</Provider>
		);
	}
}

export default App;