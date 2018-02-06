import React, { Component } from 'react';
import {
  ListView,
  TouchableOpacity
} from 'react-native';
import EmployeeItem from '../components/EmployeeItem';
import { connect } from 'react-redux';
import {
  employeesFetch
} from '../actions/EmployeeActions';
import _ from 'lodash';

class EmployeesScreen extends Component {

  componentWillMount() {
    this.props.employeesFetch();

    this.createDataSource(this.props);
  }

  componentWillReceiveProps(newProps) {
    console.log('receive props');
    this.createDataSource(newProps);
  }
s
  createDataSource({ employees }) {
    const ds = new ListView.DataSource({
      rowHasChanged: (r1, r2) => r1 !== r2
    });

    this.dataSource = ds.cloneWithRows(employees);
  }

  renderRow(employee) {
    return <EmployeeItem employee={employee} navigation={this.props.navigation} />;
  }

  render() {
    return (
      <ListView
        style={styles.container}
        enableEmptySections
        dataSource={this.dataSource}
        renderRow={this.renderRow.bind(this)}
      />
    );
  }
}

const styles = {
  container: {
    flex: 1,
  },
};

const mapStateToProps = state => {
  const employees = _.map(state.employees, (val, uid) => {
    return { ...val, uid };
  });

  return { employees };
};

export default connect(mapStateToProps, { employeesFetch })(EmployeesScreen);
