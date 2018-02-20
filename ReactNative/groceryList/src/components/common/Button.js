import React from 'react'
import { Text, TouchableOpacity } from 'react-native'

const Button = ({ style, onPress, children }) => {
  const { buttonStyle, textStyle } = styles;

  return (
    <TouchableOpacity style={[buttonStyle, style]} onPress={onPress}>
      <Text style={textStyle}>{children}</Text>
    </TouchableOpacity>
  )
}

const styles = {
  buttonStyle: {
    flex: 1,
    width: null,
    height: 50,
    backgroundColor: '#43A047',
    alignSelf: 'stretch',
    alignItems: 'center',
    justifyContent: 'center',
  },
  textStyle: {
    fontSize: 16,
    fontWeight: '600',
    color: '#fff'
  }
}

export { Button };
