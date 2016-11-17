import React from 'react'
import DetailsField from './cite-details-field'

export default class Details extends React.Component {
  constructor(props) {
    super(props)
  }

  render() {
    let { fields }  = this.props
    return (
        <div>
          {fields.map(function(field, i) {
            return <DetailsField key={i} {...field} />  
          })}
        </div>
      )
  }
}

const propTypes = {
  fields: React.PropTypes.array.isRequired
}

Details.propTypes = propTypes