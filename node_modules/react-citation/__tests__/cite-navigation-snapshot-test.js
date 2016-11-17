import React from 'react'
import renderer from 'react-test-renderer'
import CiteNavigation from '../src/cite-navigation'

describe('CiteNavigation Tests', () => {
  const items =
    [
      {class_name: "active", label: "Foo"},
      {label: "Bar"}
    ]

  it("renders an audio", function(){
    const component = renderer.create(
      <CiteNavigation items={items} setActiveItem={() => {}} getActiveItemIndex={() => {0}} />
    )
    let tree = component.toJSON()
    expect(tree).toMatchSnapshot()
  })
})