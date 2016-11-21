"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});

var _react = require("react");

var _react2 = _interopRequireDefault(_react);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

var Transcript = function Transcript(props) {
  return _react2.default.createElement(
    "div",
    { className: "transcript" },
    props.transcript
  );
};

var propTypes = {
  transcript: _react2.default.PropTypes.string.isRequired
};

Transcript.propTypes = propTypes;

exports.default = Transcript;