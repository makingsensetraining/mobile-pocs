import React, { Component } from 'react';
import { View } from 'react-native';
import { Card, CardLayout, Button } from '../components/common';
import EmployeeForm from '../components/EmployeeForm';
import { employeeUpdate, employeeEdit, employeeDelete } from '../actions/EmployeeActions';
import { connect } from 'react-redux';
import _ from 'lodash';

class EditEmployeeScreen extends Component {

  componentWillMount() {
    console.log(this.props.navigation.state.params);
    _.each(this.props.navigation.state.params, (value, key) => {
      this.props.employeeUpdate({ key, value });
    });
  }

  onEditButtonPress() {
    const { uid, name, phone, shift } = this.props;

    this.props.employeeEdit({ uid, name, phone, shift });
  }

  onFireButtonPress() {
    const { uid } = this.props;

    this.props.employeeDelete({ uid });
  }

  render() {
    return (
      <View style={styles.container}>
        <Card>
          <EmployeeForm />
          <CardLayout>
            <Button onPress={this.onEditButtonPress.bind(this)}>
              Save Employee 
            </Button>
          </CardLayout>
          <CardLayout>
            <Button style={{ backgroundColor: '#dd0000' }} onPress={this.onFireButtonPress.bind(this)}>
              Fire Employee
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
    justifyContent: 'center'
  }
};

const mapStateToProps = (state, props) => {
  const { uid, name, phone, shift } = state.employeeForm;

  return { uid, name, phone, shift };
}

export default connect(mapStateToProps, { employeeUpdate, employeeEdit, employeeDelete })(EditEmployeeScreen);
