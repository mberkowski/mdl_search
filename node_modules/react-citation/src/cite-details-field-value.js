import React from 'react'

export default class DetailsFieldValue extends React.Component {
  constructor(props) {
    super(props)
  }

  render() {
    let { url, text, delimiter } = this.props
    let field = (url) ? <a href={url}>{text}</a> : text
    return (<span>{field}{delimiter}</span>)
  }
}

const propTypes = {
  text: React.PropTypes.string.isRequired,
  url: React.PropTypes.string
}
