import React, { Component } from 'react';
import { View } from 'react-native';
import { Card, CardLayout, Button, Confirm } from '../components/common';
import ProductForm from '../components/ProductForm';
import { productUpdate, productSave, productDelete } from '../actions/ProductActions';
import { connect } from 'react-redux';
import _ from 'lodash';

class EditProductScreen extends Component {
  state = { showModal: false };

  componentWillMount() {
    _.each(this.props.product, (value, key) => {
      this.props.productUpdate({ prop: key, value});
    });
  }

  onEditButtonPress() {
    const { uid, name, count, brand } = this.props;

    this.props.productSave({ name, count, brand, uid });
  }


  onAccept() {
    const { uid } = this.props.product;

    this.props.productDelete({ uid });
    this.setState({ showModal: false });
  }

  onDecline() {
    this.setState({ showModal: false });
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
          
          <CardLayout>
            <Button onPress={() => this.setState({ showModal: !this.state.showModal })}>
              Delete Product 
            </Button>
          </CardLayout>

          <Confirm
            visible={this.state.showModal}
            onAccept={this.onAccept.bind(this)}
            onDecline={this.onDecline.bind(this)}
          >
            Are you sure you want to delete this?
          </Confirm>
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

export default connect(mapStateToProps, { productUpdate, productSave, productDelete })(EditProductScreen);
