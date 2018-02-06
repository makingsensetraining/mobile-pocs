import React, { Component } from 'react';
import { View, Picker, Text } from 'react-native';
import {
  CardLayout,
  Input,
  Button
} from './common';
import {
  employeeUpdate
} from '../actions/EmployeeActions';
import { connect } from 'react-redux';

class EmployeeForm extends Component {

  render() {
    const { shiftContainer, shiftText } = styles;

    return (
      <View>
        <CardLayout>
          <Input
            caption="Name"
            placeholder="Mike Insense"
            value={this.props.name}
            onChangeText={value => this.props.employeeUpdate({ key: 'name', value })}
          />
        </CardLayout>
        <CardLayout>
          <Input
            caption="Phone"
            placeholder="888-8888"
            value={this.props.phone}
            onChangeText={value => this.props.employeeUpdate({ key: 'phone', value })}
          />
        </CardLayout>
        <CardLayout style={shiftContainer}>
          <Text style={shiftText}>Shift</Text>
          <Picker
            selectedValue={this.props.shift}
            onValueChange={value => this.props.employeeUpdate({ key: 'shift', value })}>
            <Picker.Item label="Monday" value="Monday" />
            <Picker.Item label="Tuesday" value="Tuesday" />
            <Picker.Item label="Wednesday" value="Wednesday" />
            <Picker.Item label="Thursday" value="Thursday" />
            <Picker.Item label="Friday" value="Friday" />
            <Picker.Item label="Saturday" value="Saturday" />
            <Picker.Item label="Sunday" value="Sunday" />
          </Picker>
        </CardLayout>
      </View>
    )
  }
}

const styles = {
  shiftContainer: {
    flexDirection: 'column'
  },
  shiftText: {
    marginTop: 10,
    marginLeft: 10,
    fontSize: 14,
  },
};

const mapStateToProps = (state) => {
  const { name, phone, shift } =  state.employeeForm;

  return { name, phone, shift };
}

export default connect(mapStateToProps, { employeeUpdate })(EmployeeForm);
