import React from 'react'
import DetailsFieldValue from './cite-details-field-value'

export default class DetailsField extends React.Component {
  constructor(props) {
    super(props)
  }

  render() {
    let { field_values, label, delimiter} = this.props
    return (
             <div className={'field field-' + label.toLowerCase().replace(/\s/g, '-')}><label className='label label-default'>{label}:</label>
                {field_values.map(function(field_value, i) {
                  delimiter = (i < field_values.length - 1) ? delimiter : ''
                  return <DetailsFieldValue key={i} {...field_value} delimiter={delimiter}/>
                })}
             </div>
           )
  }
}

const propTypes = {
  label: React.PropTypes.string.isRequired,
  delimiter: React.PropTypes.string,
  url: React.PropTypes.string,
  field_values: React.PropTypes.array.isRequired
}
