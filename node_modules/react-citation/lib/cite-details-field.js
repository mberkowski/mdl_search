'use strict';

Object.defineProperty(exports, "__esModule", {
  value: true
});

var _extends = Object.assign || function (target) { for (var i = 1; i < arguments.length; i++) { var source = arguments[i]; for (var key in source) { if (Object.prototype.hasOwnProperty.call(source, key)) { target[key] = source[key]; } } } return target; };

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

var _react = require('react');

var _react2 = _interopRequireDefault(_react);

var _citeDetailsFieldValue = require('./cite-details-field-value');

var _citeDetailsFieldValue2 = _interopRequireDefault(_citeDetailsFieldValue);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _possibleConstructorReturn(self, call) { if (!self) { throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); } return call && (typeof call === "object" || typeof call === "function") ? call : self; }

function _inherits(subClass, superClass) { if (typeof superClass !== "function" && superClass !== null) { throw new TypeError("Super expression must either be null or a function, not " + typeof superClass); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, enumerable: false, writable: true, configurable: true } }); if (superClass) Object.setPrototypeOf ? Object.setPrototypeOf(subClass, superClass) : subClass.__proto__ = superClass; }

var DetailsField = function (_React$Component) {
  _inherits(DetailsField, _React$Component);

  function DetailsField(props) {
    _classCallCheck(this, DetailsField);

    return _possibleConstructorReturn(this, (DetailsField.__proto__ || Object.getPrototypeOf(DetailsField)).call(this, props));
  }

  _createClass(DetailsField, [{
    key: 'render',
    value: function render() {
      var _props = this.props,
          field_values = _props.field_values,
          label = _props.label,
          delimiter = _props.delimiter;

      return _react2.default.createElement(
        'div',
        { className: 'field field-' + label.toLowerCase().replace(/\s/g, '-') },
        _react2.default.createElement(
          'label',
          { className: 'label label-default' },
          label,
          ':'
        ),
        field_values.map(function (field_value, i) {
          delimiter = i < field_values.length - 1 ? delimiter : '';
          return _react2.default.createElement(_citeDetailsFieldValue2.default, _extends({ key: i }, field_value, { delimiter: delimiter }));
        })
      );
    }
  }]);

  return DetailsField;
}(_react2.default.Component);

exports.default = DetailsField;


var propTypes = {
  label: _react2.default.PropTypes.string.isRequired,
  delimiter: _react2.default.PropTypes.string,
  url: _react2.default.PropTypes.string,
  field_values: _react2.default.PropTypes.array.isRequired
};