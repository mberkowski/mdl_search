'use strict';

Object.defineProperty(exports, "__esModule", {
  value: true
});

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

var _react = require('react');

var _react2 = _interopRequireDefault(_react);

var _reactActiveItem = require('react-active-item');

var _reactActiveItem2 = _interopRequireDefault(_reactActiveItem);

var _citeNavigation = require('./cite-navigation');

var _citeNavigation2 = _interopRequireDefault(_citeNavigation);

var _citeDetails = require('./cite-details');

var _citeDetails2 = _interopRequireDefault(_citeDetails);

var _citeCitation = require('./cite-citation');

var _citeCitation2 = _interopRequireDefault(_citeCitation);

var _citeDownload = require('./cite-download');

var _citeDownload2 = _interopRequireDefault(_citeDownload);

var _citeTranscript = require('./cite-transcript');

var _citeTranscript2 = _interopRequireDefault(_citeTranscript);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _possibleConstructorReturn(self, call) { if (!self) { throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); } return call && (typeof call === "object" || typeof call === "function") ? call : self; }

function _inherits(subClass, superClass) { if (typeof superClass !== "function" && superClass !== null) { throw new TypeError("Super expression must either be null or a function, not " + typeof superClass); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, enumerable: false, writable: true, configurable: true } }); if (superClass) Object.setPrototypeOf ? Object.setPrototypeOf(subClass, superClass) : subClass.__proto__ = superClass; }

var ReactCitation = function (_React$Component) {
  _inherits(ReactCitation, _React$Component);

  function ReactCitation(props) {
    _classCallCheck(this, ReactCitation);

    var _this = _possibleConstructorReturn(this, (ReactCitation.__proto__ || Object.getPrototypeOf(ReactCitation)).call(this, props));

    _this._viewer = _this._viewer.bind(_this);
    return _this;
  }

  _createClass(ReactCitation, [{
    key: '_viewer',
    value: function _viewer() {
      var item = this.props.getActiveItem();
      switch (item.type) {
        case 'details':
          return _react2.default.createElement(_citeDetails2.default, { fields: item.fields });
          break;
        case 'citation':
          return _react2.default.createElement(_citeCitation2.default, { fields: item.fields });
          break;
        case 'download':
          return _react2.default.createElement(_citeDownload2.default, { fields: item.fields });
          break;
        case 'transcript':
          return _react2.default.createElement(_citeTranscript2.default, { transcript: item.transcript });
          break;
        default:
          return _react2.default.createElement(
            'div',
            null,
            'No Viewer Avaialable for type: "',
            type,
            '"'
          );
      }
    }
  }, {
    key: 'render',
    value: function render() {
      var type = this.props.getActiveItem().type;
      return _react2.default.createElement(
        'div',
        null,
        _react2.default.createElement(_citeNavigation2.default, this.props),
        _react2.default.createElement(
          'div',
          { className: "cite-" + type },
          this._viewer()
        )
      );
    }
  }]);

  return ReactCitation;
}(_react2.default.Component);

var propTypes = {
  items: _react2.default.PropTypes.array.isRequired
};

ReactCitation.propTypes = propTypes;

exports.default = (0, _reactActiveItem2.default)(ReactCitation);