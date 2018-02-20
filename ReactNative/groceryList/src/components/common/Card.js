import React from 'react';
import { View } from 'react-native';

const Card = (props) => {
    return (
        <View style={styles.constainerStyle}>
          {props.children}
        </View>
    );
};

const styles = {
    constainerStyle: {
      borderWidth: 1,
      borderColor: '#F1F1F1',
      borderBottomWidth: 0,
      marginLeft: 5,
      marginRight: 5,
      marginTop: 10
    }
};

export { Card };
