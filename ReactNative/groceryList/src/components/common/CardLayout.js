import React, { Component, } from 'react'
import { View, } from 'react-native'

const CardLayout = (props) => {
    return (
      <View style={[styles.containerStyle, props.style]}>
        {props.children}
      </View>
    );
};

const styles = {
  containerStyle: {
    borderBottomWidth: 1,
    borderBottomColor: '#F1F1F1',
    padding: 5,
    backgroundColor: '#fff',
    justifyContent: 'flex-start',
    flexDirection: 'row',
    position: 'relative'
  }
}

export { CardLayout };
