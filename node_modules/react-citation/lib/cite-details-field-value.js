'use strict';

Object.defineProperty(exports, "__esModule", {
  value: true
});

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

var _react = require('react');

var _react2 = _interopRequireDefault(_react);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _possibleConstructorReturn(self, call) { if (!self) { throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); } return call && (typeof call === "object" || typeof call === "function") ? call : self; }

function _inherits(subClass, superClass) { if (typeof superClass !== "function" && superClass !== null) { throw new TypeError("Super expression must either be null or a function, not " + typeof superClass); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, enumerable: false, writable: true, configurable: true } }); if (superClass) Object.setPrototypeOf ? Object.setPrototypeOf(subClass, superClass) : subClass.__proto__ = superClass; }

var DetailsFieldValue = function (_React$Component) {
  _inherits(DetailsFieldValue, _React$Component);

  function DetailsFieldValue(props) {
    _classCallCheck(this, DetailsFieldValue);

    var _this = _possibleConstructorReturn(this, (DetailsFieldValue.__proto__ || Object.getPrototypeOf(DetailsFieldValue)).call(this, props));

    _this._field = _this._field.bind(_this);
    _this._link = _this._link.bind(_this);
    _this._danger = _this._danger.bind(_this);
    _this._delimiter = _this._delimiter.bind(_this);
    _this._text = _this._text.bind(_this);
    return _this;
  }

  _createClass(DetailsFieldValue, [{
    key: '_createMarkup',
    value: function _createMarkup(value) {
      return { __html: value };
    }
  }, {
    key: '_link',
    value: function _link() {
      return '<a href="' + this.props.url + '">' + this.props.text + '</a>';
    }
  }, {
    key: '_field',
    value: function _field() {
      if (this.props.url) {
        return this._danger(this._link());
      } else {
        return this._danger(this.props.text);
      }
    }
  }, {
    key: '_danger',
    value: function _danger(html) {
      return _react2.default.createElement('div', { dangerouslySetInnerHTML: this._createMarkup(html) });
    }
  }, {
    key: '_text',
    value: function _text() {
      return this.props.text == 'undefined' ? this._danger(this.props.text) : '';
    }
  }, {
    key: '_delimiter',
    value: function _delimiter() {
      return this.props.delimiter == 'undefined' ? this._danger(this.props.delimiter) : '';
    }
  }, {
    key: 'render',
    value: function render() {
      return _react2.default.createElement(
        'span',
        null,
        this._field(),
        this._delimiter()
      );
    }
  }]);

  return DetailsFieldValue;
}(_react2.default.Component);

exports.default = DetailsFieldValue;


var propTypes = {
  text: _react2.default.PropTypes.string.isRequired,
  delimiter: _react2.default.PropTypes.string,
  url: _react2.default.PropTypes.string
};

DetailsFieldValue.propTypes = propTypes;