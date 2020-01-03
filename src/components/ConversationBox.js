import React from 'react';
import {
    Box,
    InfiniteScroll
} from 'grommet';
import ChatElement from './ChatElement'

const ConversationBox = ({ totalLineIndex, paragraph }) => (
    <Box background="color3" direction='column' align='center' justify='center' flex overflow={{ horizontal: 'hidden' }}>
        <InfiniteScroll replace={true} items={paragraph} show={totalLineIndex} >
            {(item, index) => {
                if (index === totalLineIndex)
                    return (<ChatElement
                        animation={{
                            "type": "fadeIn",
                            "delay": 0,
                            "duration": 1000,
                            "size": "large"
                        }}
                        key={index} item={item}></ChatElement>)
                else
                    return (<ChatElement key={index} item={item}></ChatElement>)
            }
            }

        </InfiniteScroll>
    </Box>
);

export default ConversationBox;