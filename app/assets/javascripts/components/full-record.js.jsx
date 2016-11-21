import React from 'react'
import Borealis from 'react-borealis'
import ReactCitation from 'react-citation'
var app = window.app = global.app = {};

export default class FullRecord extends React.Component {
    constructor(props) {
        super(props)
    }

    render() {
      return  (
                <div>
                  <div className="row">
                    <Borealis assets={this.props.assets } />
                  </div>
                  <div className="row citation">
                    <ReactCitation items={this.props.items } />
                  </div>
                </div>
              )
    }

}

app.FullRecord = FullRecord