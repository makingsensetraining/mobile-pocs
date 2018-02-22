import React, { Component } from 'react';
import { 
  ListView,
  TouchableOpacity
} from 'react-native';
import ProductItem from '../components/ProductItem';
import { connect } from 'react-redux';
import { productsFetch } from '../actions/ProductActions';
import _ from 'lodash';

class ProductsScreen extends Component {

  componentWillMount() {
    this.props.productsFetch();
    this.createDataSource(this.props);
  }

  componentWillReceiveProps(newProps) {
    this.createDataSource(newProps);
  }

  createDataSource({ products }) {
    const ds = new ListView.DataSource({
      rowHasChanged: (r1, r2) => r1 !== r2
    });

    this.dataSource = ds.cloneWithRows(products);
  }

  renderRow(product) {
    return <ProductItem product={product} />;
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
    flex: 1
  }
};

const mapStateToProps = state => {
  const products = _.map(state.products, (val, uid) => {
    return { ...val, uid };
  });

  return { products };
};

export default connect(mapStateToProps, { productsFetch })(ProductsScreen);
