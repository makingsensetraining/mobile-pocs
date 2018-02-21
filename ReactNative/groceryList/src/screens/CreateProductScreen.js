import React, { Component } from 'react';
import { Picker, Text } from 'react-native';
import { connect } from 'react-redux';
import { productUpdate, productCreate } from '../actions';
import { Card, CardLayout, Input, Button } from '../components/common';

class CreateProductScreen extends Component {
  onButtonPress() {
    const { name, count, brand } = this.props;

    this.props.productCreate({ name, count, brand: brand || 'None' });
  }

  render() {
    const { pickerContainer, pickerTextStyle } = styles;

    return (
      <Card>
        <CardLayout>
          <Input
            label="Name"
            placeholder="Gaseosa"
            value={this.props.name}
            onChangeText={ text => this.props.productUpdate({ prop: 'name', value: text})}
          />
        </CardLayout>

        <CardLayout>
          <Input
            label="Count"
            placeholder="2"
            value={this.props.count}
            onChangeText={ text => this.props.productUpdate({ prop: 'count', value: text})}
          />
        </CardLayout>
        
        <CardLayout style={pickerContainer}>
          <Text style={pickerTextStyle}>Brand</Text>
          <Picker
            style={{ flex: 1 }}
            selectedValue={this.props.brand}
            onValueChange={value => this.props.productUpdate({ prop: 'brand', value })}
          >
            <Picker.Item label="None" value="None" />
            <Picker.Item label="Coca-Cola" value="Coca-Cola" />
            <Picker.Item label="Ariel" value="Ariel" />
            <Picker.Item label="Ala" value="Ala" />
            <Picker.Item label="Paladini" value="Paladini" />
            <Picker.Item label="Cagnoli" value="Cagnoli" />
          </Picker>
        </CardLayout>

        <CardLayout>
          <Button onPress={this.onButtonPress.bind(this)}>
            Create
          </Button>
        </CardLayout>
      </Card>
    );
  }
}

const styles = {
  pickerContainer: {
    flexDirection: 'column'
  },
  pickerTextStyle: {
    fontSize: 18,
    paddingLeft: 20
  }
}

const mapStateToProps = (state) => {
  const { name, count, brand } = state.productForm;

  return { name, count, brand }
};

export default connect(mapStateToProps, {  productUpdate, productCreate })(CreateProductScreen);