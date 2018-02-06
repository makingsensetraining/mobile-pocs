import React, { Component } from 'react';
import { View } from 'react-native';
import { Card, CardLayout, Button } from '../components/common';
import EmployeeForm from '../components/EmployeeForm';
import { employeeUpdate, employeeCreate } from '../actions/EmployeeActions';
import { connect } from 'react-redux';

class CreateEmployeeScreen extends Component {

  componentWillMount() {
    this.props.employeeUpdate({ key: 'name', value: '' });
    this.props.employeeUpdate({ key: 'phone', value: '' });
    this.props.employeeUpdate({ key: 'shift', value: '' });
  }

  onCreateButtonPress() {
    const { name, phone, shift } = this.props;

    this.props.employeeCreate({ name, phone, shift });
  }

  render() {
    return (
      <View style={styles.container}>
        <Card>
          <EmployeeForm {...this.props} />
          <CardLayout>
            <Button onPress={this.onCreateButtonPress.bind(this)}>
              Create
            </Button>
          </CardLayout>
        </Card>
      </View>
    );
  }
}

const styles = {
  container: {
    flex: 1,
    justifyContent: 'center',
  }
};

const mapStateToProps = state => {
  const { name, phone, shift } = state.employeeForm;

  return { name, phone, shift };
}

export default connect(mapStateToProps, { employeeUpdate, employeeCreate })(CreateEmployeeScreen);
