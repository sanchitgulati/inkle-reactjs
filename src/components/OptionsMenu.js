import React from 'react';
import {
    Box,
    Text
} from 'grommet';

import simpleSFX from 'simple-sfx';
const click = new simpleSFX(['/Click.mp3']);

const OptionsMenu = ({ choices, handleStory, animation }) => (


    <Box
        pad="small"
        height={{ max: "100px" }}
        elevation='medium'
        style={{ zIndex: '1' }}
        background={{
            color: "color1",
        }}
        flex align='center' justify='center' >
        <Box
            flex
            align='center'
            gap="small"
            direction="row"
        >
            {choices.map((value, index) => (
                <Box
                    pad="small"
                    animation={animation}
                    background={{
                        color: "color2",
                    }}
                    style={{justifyContent: 'center', padding: "10px", minWidth: '100px',height: '65px', borderRadius: '15px', boxShadow: 'none' }}
                    key={value.index}
                    onClick={() => { click.play('Click'); handleStory(value.index) }}>
                        <Text size={value.text.length > 15 ? value.text.length > 30 ? "xsmall" : "small" : "medium"} style={{ textAlign: "center"}}>{value.text}</Text>
                </Box>
            ))}
        </Box>
    </Box>
);

export default OptionsMenu;