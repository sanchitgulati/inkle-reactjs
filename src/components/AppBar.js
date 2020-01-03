import React from 'react';
import {
  Box,
  TextInput,
  Heading,
  Text
} from 'grommet';

const AppBar = ({ props, url, onChange, onClick }) => (
  <Box
    tag='header'
    direction='row'
    align='center'
    background='color5'
    align='center'
    gap="small"
    pad={{ left: 'medium', right: 'small', vertical: 'small' }}
    {...props}
  >
    <Heading responsive style={{minWidth:"120px"}} pad="small" level="4">Inkle Reader</Heading>
    <TextInput
      pad="small"
      responsive
      style={{minWidth:"100px"}}
      placeholder="enter story json url here"
      size="small"
      onChange={event => onChange(event.target.value)}
    />
    <Box
        pad="small"
        responsive
        size="small"
        background="color3"
        onClick={onClick}
        style={{ justifyContent: 'center', padding: "10px", minWidth: '60px', borderRadius: '4px', boxShadow: 'none' }} >
      <Text textAlign="center">Load</Text>
    </Box>
  </Box>
);

export default AppBar;