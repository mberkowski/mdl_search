import React from 'react'
import renderer from 'react-test-renderer'
import ActiveItem from '../src/react-active-item'

@ActiveItem
class TestComponent extends React.Component {
  constructor(props) {
    super(props)
    this.state = { items: this.props.items }
  }


  render() {
    return(
        <div>
          {this.state.items.map(function(item, i) {
            return <a class="set-active" key={i}><p>{item.focus}</p><p>{item.title} Item</p></a>
          })}
        </div>
      )
  }
}

describe('ActiveItem Tests', () => {
  it("Adds ActiveItemBehaviors", function(){  
    const fakeItems = [
      {focus: false, title: 'First'},
      {focus: true , title: 'Second'},
      {focus: false, title: 'Third'}
    ]
    const component = renderer.create(<TestComponent items={fakeItems} />)
    let tree = component.toJSON()
    expect(tree).toMatchSnapshot()
  })
})