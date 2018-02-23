import React, { Component } from 'react';
import { View, Text } from 'react-native';
import {
  Card,
  CardLayout,
  Input,
  Button,
  Spinner
} from '../components/common';
import {
  emailUpdate,
  passwordUpdate,
  performLogin,
} from '../actions/AuthenticationActions';
import { connect } from 'react-redux';

class LoginScreen extends Component {

  onButtonPress() {
    const { email, password } = this.props;
    this.props.performLogin({ email, password });
  }

  renderButton() {
    if (this.props.loading == true) {
      return <Spinner />
    }

    return (
      <Button onPress={this.onButtonPress.bind(this)}>
        Login
      </Button>
    );
  }

  render() {
    return (
      <View style={styles.container}>
        <Card>
          <CardLayout>
            <Input
              label="Email"
              placeholder="youremail@gmail.com"
              value={this.props.email}
              onChangeText={(text) => this.props.emailUpdate(text)}
            />
          </CardLayout>

          <CardLayout>
            <Input
              label="Password"
              placeholder="password"
              value={this.props.password}
              onChangeText={(text) => this.props.passwordUpdate(text)}
              secureTextEntry
            />
          </CardLayout>

          <CardLayout>
            {this.renderButton()}
          </CardLayout>
        </Card>

        <Text style={styles.errorStyle}>{this.props.error}</Text>
      </View>
    );
  }
}

const styles = {
  container: {
    flex: 1,
    justifyContent: 'center',
    backgroundColor: '#eee'
  },
  errorStyle: {
    color: '#ff0000',
    fontSize: 18,
    alignSelf: 'center',
    marginTop: 10
  }
};

const mapStateToProps = state => {
  const { email, password, loading, error } = state.authentication;

  return { email, password, loading, error };
}

export default connect(mapStateToProps, { emailUpdate, passwordUpdate, performLogin })(LoginScreen);
