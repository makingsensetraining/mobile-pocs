import React, { Component } from 'react';
import {
  Text,
  TouchableOpacity
} from 'react-native';
import { CardLayout } from './common';

class ProductItem extends Component {

  onRowPress() {
    const { product } = this.props;
    const { uid, name, count, brand } = product;
  }

  render() {
    return (
      <CardLayout>
        <TouchableOpacity onPress={this.onRowPress.bind(this)}>
          <Text style={styles.textStyle}>
            {this.props.product.name} - {this.props.product.brand} 
          </Text>
        </TouchableOpacity>
      </CardLayout>
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
