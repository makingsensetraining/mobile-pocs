import React, { Component } from 'react';
import { View } from 'react-native';
import { Card, CardLayout, Button } from '../components/common';
import ProductForm from '../components/ProductForm';
import { productUpdate, productSave } from '../actions/ProductActions';
import { connect } from 'react-redux';
import _ from 'lodash';

class EditProductScreen extends Component {

  componentWillMount() {
    _.each(this.props.product, (value, key) => {
      this.props.productUpdate({ prop: key, value});
    });
  }

  onEditButtonPress() {
    const { uid, name, count, brand } = this.props;

    this.props.productSave({ name, count, brand, uid });
  }

  render() {
    return (
      <View style={styles.container}>
        <Card>
          <ProductForm />
          <CardLayout>
            <Button onPress={this.onEditButtonPress.bind(this)}>
              Save Product 
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

const mapStateToProps = (state) => {
  const { uid, name, count, brand } = state.productForm;

  return { uid, name, count, brand };
};

export default connect(mapStateToProps, { productUpdate, productSave })(EditProductScreen);
