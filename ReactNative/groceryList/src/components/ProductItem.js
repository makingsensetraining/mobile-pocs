import React, { Component } from 'react';
import {
  Text,
  TouchableOpacity
} from 'react-native';
import { Actions } from 'react-native-router-flux';
import { CardLayout } from './common';

class ProductItem extends Component {

  onRowPress() {
    Actions.editProductScreen({ product: this.props.product });
  }

  render() {
    return (
      <TouchableOpacity onPress={this.onRowPress.bind(this)}>
        <CardLayout>
          <Text style={styles.textStyle}>
            {this.props.product.name} - {this.props.product.brand} 
          </Text>
        </CardLayout>
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

export default ProductItem;
