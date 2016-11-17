'use strict';

Object.defineProperty(exports, "__esModule", {
  value: true
});

var _extends = Object.assign || function (target) { for (var i = 1; i < arguments.length; i++) { var source = arguments[i]; for (var key in source) { if (Object.prototype.hasOwnProperty.call(source, key)) { target[key] = source[key]; } } } return target; };

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

exports.default = citationRender;

var _react = require('react');

var _react2 = _interopRequireDefault(_react);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _possibleConstructorReturn(self, call) { if (!self) { throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); } return call && (typeof call === "object" || typeof call === "function") ? call : self; }

function _inherits(subClass, superClass) { if (typeof superClass !== "function" && superClass !== null) { throw new TypeError("Super expression must either be null or a function, not " + typeof superClass); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, enumerable: false, writable: true, configurable: true } }); if (superClass) Object.setPrototypeOf ? Object.setPrototypeOf(subClass, superClass) : subClass.__proto__ = superClass; }

function citationRender(CitationFormat) {
  return function (_React$Component) {
    _inherits(Citation, _React$Component);

    function Citation(props) {
      _classCallCheck(this, Citation);

      var _this = _possibleConstructorReturn(this, (Citation.__proto__ || Object.getPrototypeOf(Citation)).call(this, props));

      _this.render_citation = _this.render_citation.bind(_this);
      _this._format = _this._format.bind(_this);
      _this.override_mappings = _this.override_mappings.bind(_this);
      _this._override_mapping = _this._override_mapping.bind(_this);
      _this._values = _this._values.bind(_this);
      return _this;
    }

    _createClass(Citation, [{
      key: 'override_mappings',
      value: function override_mappings(mappings) {
        var _this2 = this;

        return mappings.map(function (mapping) {
          return _this2._override_mapping(mapping)[0];
        });
        return mapped;
      }
    }, {
      key: 'render_citation',
      value: function render_citation(_ref) {
        var _ref$mappings = _ref.mappings,
            mappings = _ref$mappings === undefined ? [] : _ref$mappings,
            _ref$render_html = _ref.render_html,
            render_html = _ref$render_html === undefined ? false : _ref$render_html,
            _ref$prefix = _ref.prefix,
            prefix = _ref$prefix === undefined ? '' : _ref$prefix,
            _ref$suffix = _ref.suffix,
            suffix = _ref$suffix === undefined ? '' : _ref$suffix;

        if (render_html) {
          return _react2.default.createElement(
            'span',
            null,
            _react2.default.createElement('div', { dangerouslySetInnerHTML: { __html: prefix + this._values(mappings) + suffix } })
          );
        } else {
          return _react2.default.createElement(
            'span',
            null,
            prefix,
            this._values(mappings),
            prefix
          );
        }
      }
    }, {
      key: '_values',
      value: function _values(mappings) {
        var affix = this._affix;
        var format = this._format;
        var props = this.props;
        var values = [];
        mappings.map(function (field, i) {
          var field_name = Object.keys(field)[0];
          var val = props.field_values[field_name];
          if (val) {
            var config = field[field_name];
            var formatted = format(val, config.formatters);
            values.push(affix(formatted, config.prefix, config.suffix));
          }
        });
        return values.join('');
      }
    }, {
      key: '_affix',
      value: function _affix(value, prefix, suffix) {
        return value ? prefix + value + suffix : '';
      }
    }, {
      key: '_format',
      value: function _format(value) {
        var formatters = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : [function (value) {
          return value;
        }];

        return formatters.map(function (formatter) {
          return formatter(value);
        }, value);
      }
    }, {
      key: '_override_mapping',
      value: function _override_mapping(mapping) {
        return this.props.mappings.map(function (mapping_override) {
          if (mapping[Object.keys(mapping_override)[0]]) {
            return mapping_override;
          } else {
            return mapping;
          }
        });
      }
    }, {
      key: 'render',
      value: function render() {
        return _react2.default.createElement(CitationFormat, _extends({}, this.props, {
          override_mappings: this.override_mappings,
          render_citation: this.render_citation }));
      }
    }]);

    return Citation;
  }(_react2.default.Component);
}