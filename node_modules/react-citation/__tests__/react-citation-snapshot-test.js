import React from 'react'
import renderer from 'react-test-renderer'
import ReactCitation from '../src/react-citation'

describe('ReactCitation Test', () => {
  it('renders react citation', function(){
    const items =
        [
          {
            focus: true,
            type: 'details',
            label: 'Details',
            fields:
              [
                {
                  label: 'Title',
                  field_values: [
                    {text: 'Daemon', url: 'https://www.amazon.com/DAEMON-Daniel-Suarez/dp/0451228731'}
                  ]
                },
                {
                  label: 'Title',
                  field_values: [
                    {text: 'Snow Crash', url: 'https://www.amazon.com/Snow-Crash-Neal-Stephenson/dp/0553380958/ref=sr_1_1?s=books&ie=UTF8&qid=1478114241&sr=1-1&keywords=snowcrash'},
                    {text: 'Ender\'s Lame'}
                  ]
                }
              ]
            }
          ]
    let component = renderer.create(<ReactCitation items={items} />)
    let tree = component.toJSON()
    expect(tree).toMatchSnapshot()
  })
})