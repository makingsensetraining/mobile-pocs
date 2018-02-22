import React, { Component } from 'react';
import { connect } from 'react-redux';
import { productCreate } from '../actions';
import { CardLayout, Card, Button } from '../components/common';
import ProductForm from '../components/ProductForm';

class CreateProductScreen extends Component {
	onButtonPress() {
		const { name, count, brand } = this.props;

		this.props.productCreate({ name, count, brand: brand || 'None' });
	}

	render() {
		return (
			<Card>
				<ProductForm {...this.props} />
				<CardLayout>
					<Button onPress={this.onButtonPress.bind(this)}>
						Create
					</Button>
				</CardLayout>
			</Card>
		);
	}
}

const mapStateToProps = (state) => {
	const { name, count, brand } = state.productForm;

	return { name, count, brand };
};

export default connect(mapStateToProps, {  productCreate })(CreateProductScreen);