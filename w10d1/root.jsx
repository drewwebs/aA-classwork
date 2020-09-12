import React from 'react';
import Clock from './frontend/clock';
import Tabs from './frontend/tabs';

const Root = (props) => {
    // console.log(props);
    const panes = [{name: "One", content: "hello" }, {name: "Two", content: "hi"}, { name: "Three", content: "bye"} ];
    return <div>
        <Clock />
        
        <Tabs panes={panes} />
        
    </div>
}

export default Root;