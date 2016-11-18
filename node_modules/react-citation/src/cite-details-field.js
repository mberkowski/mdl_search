import React from 'react'
import DetailsFieldValue from './cite-details-field-value'

export default class DetailsField extends React.Component {
  constructor(props) {
    super(props)
  }

  render() {
    let { field_values, label, delimiter} = this.props
    return (
             <span>
                <dt className="col-sm-3 field-label">
                  <label className='label label-default'>{label}:</label>
                </dt>
                <dd className="col-sm-9 field-definition">
                  {field_values.map(function(field_value, i) {
                    delimiter = (i < field_values.length - 1) ? delimiter : ''
                    let field = (field_value.url) ? <a href={field_value.url}>{field_value.text}</a> : field_value.text
                    return  (<span>{field}{delimiter}</span>)
                  })}
                </dd>
             </span>
           )
  }
}

const propTypes = {
  label: React.PropTypes.string.isRequired,
  delimiter: React.PropTypes.string,
  url: React.PropTypes.string,
  field_values: React.PropTypes.array.isRequired
}
