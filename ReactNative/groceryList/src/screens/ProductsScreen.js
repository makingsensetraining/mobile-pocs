
				<Text> Product List </Text>
			</View>
		);
	}
}

const styles = {
  container: {
    flex: 1,
  },
};

const mapStateToProps = state => {
  const products = _.map(state.products, (val, uid) => {
    return { ...val, uid };
  });

  return { products };
};

export default connect(mapStateToProps, { productsFetch })(ProductsScreen);

				<Text> Product List </Text>
			</View>
		);
	}
class ProductsScreen extends Component {

  componentWillMount() {
    this.props.productsFetch();

    this.createDataSource(this.props);
  }

  componentWillReceiveProps(newProps) {
    console.log('receive props');
    this.createDataSource(newProps);
  }
s
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
    flex: 1,
  },
};

const mapStateToProps = state => {
  const products = _.map(state.products, (val, uid) => {
    return { ...val, uid };
  });

  return { products };
};

export default connect(mapStateToProps, { productsFetch })(ProductsScreen);
