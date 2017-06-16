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
                    <Borealis basename=''
                              config={this.props.borealis_config } />
                  </div>
                  <div className="addthis_inline_share_toolbox"></div>
                  <div className="row citation">
                    <ReactCitation items={this.props.citation_config } />
                  </div>
                </div>
              )
    }

}

app.FullRecord = FullRecord