import React, { Component } from 'react';
import {
  View,
  Text,
  TouchableOpacity
} from 'react-native';
import { NavigationActions } from 'react-navigation';

class EmployeeItem extends Component {

  onRowPress() {
    const { navigation, employee } = this.props;
    const { uid, name, phone, shift } = employee;
    navigation.navigate('EditEmployee', { uid, name, phone, shift });
  }

  render() {
    return (
      <TouchableOpacity onPress={this.onRowPress.bind(this)}>
        <Text style={styles.textStyle}>
          {this.props.employee.name}
        </Text>
      </TouchableOpacity>
    );
  }
}

const styles = {
  textStyle: {
    fontSize: 18,
    margin: 15
  }
};

export default EmployeeItem;
