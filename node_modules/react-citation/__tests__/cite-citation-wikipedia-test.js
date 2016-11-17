import React from 'react'
import renderer from 'react-test-renderer'
import CitationWikipedia from '../src/cite-citation-wikipedia'

describe('CitationWikipedia Tests', () => {
  it("renders a citation", function(){  

    const fields = {
      creator: 'Fred',
      type: 'Article',
      creation_date: '09/01/2001',
      title: 'Fred and his dog',
      current_date: 'November 8, 2017',
      contributing_organization: 'Fred and co',
      url: 'http://www.example.com/fred'
    }

    let component = renderer.create(<CitationWikipedia field_values={fields} />)
    let tree = component.toJSON()
    expect(tree).toMatchSnapshot()
  })
})