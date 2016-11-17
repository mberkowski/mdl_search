import React from 'react'
import renderer from 'react-test-renderer'
import CiteTranscript from '../src/cite-transcript'

describe('CiteTranscript Tests', () => {
  it("renders a citation transcript", function(){  
    const transcript = 'This is a transcript'
    let component = renderer.create(<CiteTranscript transcript={transcript} />)
    let tree = component.toJSON()
    expect(tree).toMatchSnapshot()
  })
})