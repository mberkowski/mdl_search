import ActiveItem from '../src/react-active-item'
import React from 'react';
import { shallow } from 'enzyme';


describe('ActiveItem Component', function() {

  let wrapper, ActiveItemComponent, MockItemComponent, instance, set

  beforeEach(function () {
    MockItemComponent = React.createClass({
      render: function () {
        return (<div>Fact Active Item</div>)
      },
    })

    const fakeItems = [
      {focus: false, title: 'First'},
      {focus: true , title: 'Second'},
      {focus: false, title: 'Third'}
    ]

    set = new Set();
    ActiveItemComponent = ActiveItem(MockItemComponent);
    wrapper = shallow(<ActiveItemComponent items={fakeItems} />)
    instance = wrapper.instance();
  })

  it('renders the ActiveItem Component as the root element', function () {
    expect(wrapper.first().is(MockItemComponent)).toBeTruthy();
  })

  describe('setActiveItem', function () {
    it('selects an item', function () {
      expect(instance.getActiveItem().title).toBe('Second')
      instance.setActiveItem(0)
      expect(instance.getActiveItem().title).toBe('First')
    })
  })

})