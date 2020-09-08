import React from 'react';

class Clock extends React.Component {
    constructor(props) {
        super(props);

        this.state = {date: new Date()};

        this.tick = this.tick.bind(this);
    }

    tick() {
        this.setState({date: new Date()});
    }

    componentDidMount() {
        this.clock = setInterval(this.tick, 1000);
    }
    
    componentWillUnmount() {
        clearInterval(this.clock);
    }
    
    
    render() {
        return (
            <>
            <h1 className="clock_header">Clock</h1>
                <div className='clock_box'>
                    <p className="date_box">
                        <span>Date:</span>
                        <span>{this.state.date.getMonth()+1}/{this.state.date.getDate()}/{this.state.date.getFullYear()}</span>
                    </p>

                    <p className="time_box">
                        <span>Time: </span>
                        <span>{this.state.date.toLocaleTimeString('en-US')}</span>
                    </p>
                </div>
            </>
        )
    }
    
}

export default Clock;