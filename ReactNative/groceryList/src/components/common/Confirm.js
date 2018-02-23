import React from 'react';
import { Text, View, Modal } from 'react-native';
import { Button } from './Button';
import { CardLayout } from './CardLayout';

const Confirm = ({ children, visible, onAccept, onDecline }) => {
  const { containerStyle, textStyle, cardLayoutStyle } = styles;

  return (
    <Modal
      visible={visible}
      transparent
      animationType="slide"
      onRequesClose={() => {}}
    >
      <View style={containerStyle}>
        <CardLayout style={cardLayoutStyle}>
          <Text style={textStyle}>{children}</Text>
        </CardLayout>

        <CardLayout>
          <Button onPress={onAccept}>Yes</Button>
          <Button onPress={onDecline}>No</Button>
        </CardLayout>
      </View>
    </Modal>
  );
};

const styles = {
  cardLayoutStyle: {
    justifyContent: 'center'
  },
  textStyle: {
    flex: 1,
    fontSize: 18,
    textAlign: 'center',
    lineHeight: 40
  },
  containerStyle: {
    backgroundColor: 'rgba(0,0,0, 0.75)',
    position: 'relative',
    flex: 1,
    justifyContent: 'center'
  }
};

export { Confirm };