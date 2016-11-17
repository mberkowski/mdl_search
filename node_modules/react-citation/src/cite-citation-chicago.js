import React from 'react'
import citationRender from './cite-citation-render'

class CitationChicago extends React.Component {
  constructor(props) {
    super(props)
  }

  mappings() {
    let map =  
          [
            {creator: {prefix: '', suffix: '.' }},
            {creation_date: {prefix: ' ', suffix: '.' }},
            {title: {prefix: '"', suffix: '." '}},
            {contributing_organization: {prefix: ' ', suffix: ', ' }},
            {current_date: {prefix: 'Accessed ', suffix: '.' }},
            {url: {prefix: '', suffix: '' }}
          ]
    return map
  }

  render() {
    return this.props.render_citation({mappings: this.mappings()})
  }
}

const propTypes = {
  creator: React.PropTypes.string,
  creation_date: React.PropTypes.string,
  title: React.PropTypes.string,
  contributing_organization: React.PropTypes.string,
  url: React.PropTypes.string,
  mapping: React.PropTypes.object
}

CitationChicago.propTypes = propTypes

export default citationRender(CitationChicago)