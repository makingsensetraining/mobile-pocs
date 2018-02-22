import React, { Component } from 'react';
import { Provider } from 'react-redux';
import { createStore, applyMiddleware } from 'redux';
import ReduxThunk from 'redux-thunk';
import firebase from 'firebase';
import reducers from './reducers';
import Router from './Router';

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
            <Provider store={createStore(reducers, {}, applyMiddleware(ReduxThunk))}>
                <Router />
            </Provider>
        );
    }
}

export default App;