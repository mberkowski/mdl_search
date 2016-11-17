import React from 'react'
import renderer from 'react-test-renderer'
import DetailsFieldValue from '../src/cite-details-field-value'

describe('DetailsFieldValue Test', () => {
  it("renders a field value with a url", function(){  
    let component = renderer.create(<DetailsFieldValue text="Rama" url="http://www.example.com" />)
    let tree = component.toJSON()
    expect(tree).toMatchSnapshot()
  })

  it("renders a field value without a url", function(){  
    let component1 = renderer.create(<DetailsFieldValue text="Rama" />)
    let tree = component1.toJSON()
    expect(tree).toMatchSnapshot()
  })

})