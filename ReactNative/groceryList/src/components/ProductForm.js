import React, { Component } from 'react';
import { View, Text, Picker } from 'react-native';
import { connect } from 'react-redux';
import { productUpdate } from '../actions';
import { CardLayout, Input } from './common';

class ProductForm extends Component {
	render() {
		const { pickerContainer, pickerTextStyle } = styles;

		return (
			<View>
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
			</View>
		);
	}
}


const styles = {
	pickerContainer: {
		flexDirection: 'column'
  },
	pickerTextStyle: {
		fontSize: 18,
		marginTop: 10,
		paddingLeft: 20
	}
};

const mapStateToProps = (state) => {
	const { name, count, brand } = state.productForm;

	return { name, count, brand };

}

export default connect(mapStateToProps, { productUpdate })(ProductForm);