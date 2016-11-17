'use strict';

Object.defineProperty(exports, "__esModule", {
  value: true
});

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

var _react = require('react');

var _react2 = _interopRequireDefault(_react);

var _citeCitationRender = require('./cite-citation-render');

var _citeCitationRender2 = _interopRequireDefault(_citeCitationRender);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _possibleConstructorReturn(self, call) { if (!self) { throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); } return call && (typeof call === "object" || typeof call === "function") ? call : self; }

function _inherits(subClass, superClass) { if (typeof superClass !== "function" && superClass !== null) { throw new TypeError("Super expression must either be null or a function, not " + typeof superClass); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, enumerable: false, writable: true, configurable: true } }); if (superClass) Object.setPrototypeOf ? Object.setPrototypeOf(subClass, superClass) : subClass.__proto__ = superClass; }

var CitationCoins = function (_React$Component) {
  _inherits(CitationCoins, _React$Component);

  function CitationCoins(props) {
    _classCallCheck(this, CitationCoins);

    var _this = _possibleConstructorReturn(this, (CitationCoins.__proto__ || Object.getPrototypeOf(CitationCoins)).call(this, props));

    _this.mappings = _this.mappings.bind(_this);
    return _this;
  }

  _createClass(CitationCoins, [{
    key: 'mulitvalue_field',
    value: function mulitvalue_field(values) {
      values.join(',');
    }
  }, {
    key: 'mappings',
    value: function mappings() {
      var defaultMapping = [{ creator: { prefix: '&amp;rft.creator', suffix: '', formatters: [encodeURIComponent] } }, { creation_date: { prefix: ' ', suffix: '.', formatters: [encodeURIComponent] } }, { title: { prefix: '&amp;rft.title=', suffix: '', formatters: [encodeURIComponent] } }, { description: { prefix: '&amp;rft.description=', suffix: '', formatters: [encodeURIComponent] } }, { subject: { prefix: '&amp;rft.subject=', suffix: '', formatters: [this.mulitvalue_field, encodeURIComponent] } }, { description: { prefix: '&amp;rft.description=', suffix: '', formatters: [encodeURIComponent] } }, { contributing_organization: { prefix: 'publisher', suffix: '', formatters: [encodeURIComponent] } }, { type: { prefix: '&amp;rft.type=', suffix: '', formatters: [encodeURIComponent] } }, { format: { prefix: '&amp;rft.format=', suffix: '', formatters: [encodeURIComponent] } }, { rights: { prefix: '&amp;rft.rights=', suffix: '', formatters: [encodeURIComponent] } }, { url: { prefix: '&amp;rft.identifier=', suffix: '', formatters: [encodeURIComponent] } }];
      return this.props.override_mappings(defaultMapping);
    }
  }, {
    key: 'render',
    value: function render() {
      var title = "ctx_ver=Z39.88-2004&amp;rft_val_fmt=info%3Aofi%2Ffmt%3Akev%3Amtx%3Adc";
      return this.props.render_citation({ prefix: '<span className="Z3988" title=' + title, suffix: '</span>', mappings: this.mappings(), render_html: true });
    }
  }]);

  return CitationCoins;
}(_react2.default.Component);

var propTypes = {
  creator: _react2.default.PropTypes.string,
  creation_date: _react2.default.PropTypes.string,
  title: _react2.default.PropTypes.string,
  description: _react2.default.PropTypes.string,
  contributing_organization: _react2.default.PropTypes.string,
  type: _react2.default.PropTypes.string,
  format: _react2.default.PropTypes.string,
  rights: _react2.default.PropTypes.string,
  url: _react2.default.PropTypes.string,
  mapping: _react2.default.PropTypes.object
};

CitationCoins.defaultProps = {
  mappings: [{}]
};

CitationCoins.propTypes = propTypes;

exports.default = (0, _citeCitationRender2.default)(CitationCoins);