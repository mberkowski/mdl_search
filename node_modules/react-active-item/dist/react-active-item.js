(function(f){if(typeof exports==="object"&&typeof module!=="undefined"){module.exports=f()}else if(typeof define==="function"&&define.amd){define([],f)}else{var g;if(typeof window!=="undefined"){g=window}else if(typeof global!=="undefined"){g=global}else if(typeof self!=="undefined"){g=self}else{g=this}g.reactActiveItem = f()}})(function(){var define,module,exports;return (function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
(function (global){
'use strict';

Object.defineProperty(exports, "__esModule", {
  value: true
});

var _extends = Object.assign || function (target) { for (var i = 1; i < arguments.length; i++) { var source = arguments[i]; for (var key in source) { if (Object.prototype.hasOwnProperty.call(source, key)) { target[key] = source[key]; } } } return target; };

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

exports.default = activeItem;

var _react = (typeof window !== "undefined" ? window['React'] : typeof global !== "undefined" ? global['React'] : null);

var _react2 = _interopRequireDefault(_react);

var _immutable = require('immutable');

var _immutable2 = _interopRequireDefault(_immutable);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _possibleConstructorReturn(self, call) { if (!self) { throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); } return call && (typeof call === "object" || typeof call === "function") ? call : self; }

function _inherits(subClass, superClass) { if (typeof superClass !== "function" && superClass !== null) { throw new TypeError("Super expression must either be null or a function, not " + typeof superClass); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, enumerable: false, writable: true, configurable: true } }); if (superClass) Object.setPrototypeOf ? Object.setPrototypeOf(subClass, superClass) : subClass.__proto__ = superClass; }

// TODO: Split this out as a separate react component and add as a dependency

function activeItem(WrappedComponent) {
  return function (_React$Component) {
    _inherits(ActiveItem, _React$Component);

    function ActiveItem(props) {
      _classCallCheck(this, ActiveItem);

      var _this = _possibleConstructorReturn(this, (ActiveItem.__proto__ || Object.getPrototypeOf(ActiveItem)).call(this, props));

      _this.state = { items: _this.props.items };
      _this._bindInit();
      return _this;
    }

    _createClass(ActiveItem, [{
      key: '_bindInit',
      value: function _bindInit() {
        this.getActiveItem = this.getActiveItem.bind(this);
        this.setActiveItem = this.setActiveItem.bind(this);
        this.getActiveItemIndex = this.getActiveItemIndex.bind(this);
        this._hasFocus = this._hasFocus.bind(this);
        this._updateFocus = this._updateFocus.bind(this);
        this._immutableAssets = this._immutableAssets.bind(this);
        this._unFocused = this._unFocused.bind(this);
        this._handlers = this._handlers.bind(this);
      }
    }, {
      key: 'setActiveItem',
      value: function setActiveItem(i, e) {
        if (typeof e != 'undefined') {
          e.preventDefault();
        }
        this.setState({ items: this._updateFocus(this._unFocused(), i, true).toJS() });
      }
    }, {
      key: 'getActiveItem',
      value: function getActiveItem() {
        return this.state.items.find(this._hasFocus);
      }
    }, {
      key: 'getActiveItemIndex',
      value: function getActiveItemIndex() {
        return this.state.items.findIndex(this._hasFocus);
      }

      // "private"

    }, {
      key: '_hasFocus',
      value: function _hasFocus(item) {
        return item.focus == true;
      }
    }, {
      key: '_unFocused',
      value: function _unFocused() {
        return this._updateFocus(this._immutableAssets(), this.getActiveItemIndex(), false);
      }
    }, {
      key: '_updateFocus',
      value: function _updateFocus(list, i, status) {
        return list.update(i, function (item) {
          return item.set('focus', status);
        });
      }
    }, {
      key: '_immutableAssets',
      value: function _immutableAssets() {
        return new _immutable2.default.fromJS(this.state.items);
      }
    }, {
      key: '_handlers',
      value: function _handlers() {
        return {
          setActiveItem: this.setActiveItem.bind(this),
          getActiveItem: this.getActiveItem.bind(this),
          getActiveItemIndex: this.getActiveItemIndex.bind(this)
        };
      }
    }, {
      key: 'render',
      value: function render() {
        return _react2.default.createElement(WrappedComponent, _extends({}, this.props, this.state, this._handlers()));
      }
    }]);

    return ActiveItem;
  }(_react2.default.Component);
}

}).call(this,typeof global !== "undefined" ? global : typeof self !== "undefined" ? self : typeof window !== "undefined" ? window : {})
},{"immutable":undefined}]},{},[1])(1)
});