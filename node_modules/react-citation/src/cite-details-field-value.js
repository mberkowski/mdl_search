import React from 'react'

export default class DetailsFieldValue extends React.Component {
  constructor(props) {
    super(props)
    this._field = this._field.bind(this)
  }

  _createMarkup(value) {
    return ({__html: value})
  }

  _field() {
    if (this.props.url) {
      return <a href={this.props.url.url}>{this.props.text}</a>
    } else {
      return <div dangerouslySetInnerHTML={this._createMarkup(this.props.text)} />
    }
  }

  render() {
    return <span>{this._field()}{this.props.delimiter}</span>
  }
}

const propTypes = {
  text: React.PropTypes.string.isRequired,
  delimiter: React.PropTypes.string,
  url: React.PropTypes.string
}

DetailsFieldValue.propTypes = propTypes