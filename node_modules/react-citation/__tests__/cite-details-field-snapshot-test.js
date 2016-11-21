import React from 'react'
import renderer from 'react-test-renderer'
import DetailsField from '../src/cite-details-field'

describe('Field Tests', () => {
  it("renders a field with one value", function(){  
    let field_values = 
      [
        {text: 'foo', url: 'http://example.com'},
        {text: 'bar', url: 'http://example1.com'}
      ]
    let component = renderer.create(<DetailsField field_values={field_values} label="blah" />)
    let tree = component.toJSON()
    expect(tree).toMatchSnapshot()
  })
})