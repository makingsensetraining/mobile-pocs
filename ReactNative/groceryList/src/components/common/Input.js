import React, { Component, } from 'react'
import { View, Text, TextInput } from 'react-native'

const Input = ({ caption, placeholder, value, onChangeText, secureTextEntry }) => {
  const { inputStyle, captionStyle, textInputStyle } = styles;

  return (
    <View style={inputStyle}>
      <Text style={captionStyle}>{caption}</Text>
      <TextInput
          value={value}
          onChangeText={onChangeText}
          style={textInputStyle}
          placeholder={placeholder}
          secureTextEntry={secureTextEntry}
          autoCorrect={false} />
    </View>
  );
};

const styles = {
  inputStyle: {
    flexDirection: 'row',
    alignItems: 'center',
    flex: 1,
    height: 40,
  },
  captionStyle: {
    fontSize: 14,
    width: 80,
    marginLeft: 10,
  },
  textInputStyle: {
    flex: 1,
    width: null,
    height: null,
    fontSize: 14,
  }
};

export { Input };
