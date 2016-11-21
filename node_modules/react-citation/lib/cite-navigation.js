'use strict';

Object.defineProperty(exports, "__esModule", {
  value: true
});

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

var _react = require('react');

var _react2 = _interopRequireDefault(_react);

var _citeNavigationItem = require('./cite-navigation-item');

var _citeNavigationItem2 = _interopRequireDefault(_citeNavigationItem);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _possibleConstructorReturn(self, call) { if (!self) { throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); } return call && (typeof call === "object" || typeof call === "function") ? call : self; }

function _inherits(subClass, superClass) { if (typeof superClass !== "function" && superClass !== null) { throw new TypeError("Super expression must either be null or a function, not " + typeof superClass); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, enumerable: false, writable: true, configurable: true } }); if (superClass) Object.setPrototypeOf ? Object.setPrototypeOf(subClass, superClass) : subClass.__proto__ = superClass; }

var CiteNavigation = function (_React$Component) {
  _inherits(CiteNavigation, _React$Component);

  function CiteNavigation(props) {
    _classCallCheck(this, CiteNavigation);

    var _this = _possibleConstructorReturn(this, (CiteNavigation.__proto__ || Object.getPrototypeOf(CiteNavigation)).call(this, props));

    _this.active_class = _this.active_class.bind(_this);
    _this.active_index = _this.active_index.bind(_this);
    return _this;
  }

  _createClass(CiteNavigation, [{
    key: 'active_index',
    value: function active_index() {
      return this.props.getActiveItemIndex();
    }
  }, {
    key: 'active_class',
    value: function active_class(i) {
      return this.active_index() == i ? 'active' : '';
    }
  }, {
    key: 'render',
    value: function render() {
      var _props = this.props,
          items = _props.items,
          class_name = _props.class_name,
          setActiveItem = _props.setActiveItem,
          getActiveItem = _props.getActiveItem;

      var active_class = this.active_class;
      return _react2.default.createElement(
        'ul',
        { className: 'citation-navigation ' + class_name },
        items.map(function (item, i) {
          return _react2.default.createElement(_citeNavigationItem2.default, { label: item.label,
            key: i,
            active: active_class(i),
            setActiveItem: setActiveItem.bind(this, i) });
        })
      );
    }
  }]);

  return CiteNavigation;
}(_react2.default.Component);

exports.default = CiteNavigation;


var propTypes = {
  items: _react2.default.PropTypes.array.isRequired,
  setActiveItem: _react2.default.PropTypes.func.isRequired,
  getActiveItemIndex: _react2.default.PropTypes.func.isRequired,
  class_name: _react2.default.PropTypes.string
};

CiteNavigation.defaultProps = {
  class_name: 'nav nav-pills'
};

CiteNavigation.propTypes = propTypes;