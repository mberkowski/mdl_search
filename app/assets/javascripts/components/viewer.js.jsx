import Borealis from 'react-borealis'
import React from 'react'
var app = window.app = global.app = {};

export default class MediaViewer extends React.Component {
    constructor(props) {
        super(props)
    }

    render() {
      return (<Borealis assets={this.props.assets } />
        )
    }

}

app.MediaViewer = MediaViewer