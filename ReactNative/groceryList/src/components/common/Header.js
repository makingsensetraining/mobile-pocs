// Import libraries for making a component
import React from 'react';
import { Text, View, Platform } from 'react-native';

// Make a component
const Header = (props) => {
  const { textStyle, viewStyle } = styles;

  return (
    <View style={viewStyle}>
      <Text style={textStyle}>{props.title}</Text>
    </View>
  );
};

const styles = {
  viewStyle: {
    justifyContent: 'center',
    alignItems: 'center',
    position: 'relative',
    borderBottomWidth: 1,
    borderBottomColor: '#F1F1F1',
    ...Platform.select({
      ios: {
        paddingTop: 15,
        height: 60,
        backgroundColor: '#F8F8F8'
      },
      android: {
        height: 50,
        backgroundColor: '#F5F5F5'
      }
    })
  },
  textStyle: {
      fontSize: 20
  }
};

// Make the component available to othe parts of the app
export { Header };
