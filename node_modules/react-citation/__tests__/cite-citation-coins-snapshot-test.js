import React from 'react'
import renderer from 'react-test-renderer'
import CitationCoins from '../src/cite-citation-coins'

describe('CitationCoins Tests', () => {
  it("renders a CoINs citation", function(){  

    const fields = {
      creator: 'Fred',
      creation_date: '09/01/2001',
      title: 'Fred and his dog',
      description: 'A boy and his dog',
      subject: ['dogs', 'cats'],
      contributing_organization: 'Fred and co',
      url: 'http://www.example.com/fred'
    }

    // Test overriding the core mapping
    const mappings = [
      {contributing_organization: {prefix: 'foo', suffix: 'Minnesota Digital Library', formatters: [encodeURIComponent]}}
    ]

    let component = renderer.create(<CitationCoins field_values={fields} mappings={mappings} />)
    let tree = component.toJSON()
    expect(tree).toMatchSnapshot()
  })
})