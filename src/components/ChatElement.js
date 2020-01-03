import React from 'react';
import {
    Box,
    Text
} from 'grommet';

const ChatElement = ({ item,animation }) => (
    <Box
        pad="medium"
        margin="small"
        align="center"
        animation={animation}
        flex={false}
        gap="large"
        style={{ borderRadius: '15px' }}
        background={{
            color: "color4",
        }}
    >
        <Text>{item}</Text>
    </Box>
);

export default ChatElement;