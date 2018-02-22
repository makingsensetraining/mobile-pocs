import React, { Component } from 'react';
import { View } from 'react-native';
import { connect } from 'react-redux';
import { productCreate } from '../actions';
import { CardLayout, Card, Button } from '../components/common';
import ProductForm from '../components/ProductForm';

class CreateProductScreen extends Component {
	onCreateButtonPress() {
		const { name, count, brand } = this.props;

    this.props.productCreate({ name, count, brand: brand || 'None' });
  }

	render() {
		return (
			<View style={styles.container}>
				<Card>
					<ProductForm {...this.props} />
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

const mapStateToProps = (state) => {
  const { name, count, brand } = state.productForm;

	return { name, count, brand };
};

export default connect(mapStateToProps, {  productCreate })(CreateProductScreen);