require=(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
'use strict';

var _react = require('react');

var _react2 = _interopRequireDefault(_react);

var _reactDom = require('react-dom');

var _reactDom2 = _interopRequireDefault(_reactDom);

var _reactCitation = require('react-citation');

var _reactCitation2 = _interopRequireDefault(_reactCitation);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

var date = new Date();

var App = _react2.default.createClass({
  displayName: 'App',
  render: function render() {
    var items = [{
      focus: true,
      type: 'details',
      label: 'Details',
      fields: [{
        label: 'Title',
        field_values: [{ text: 'Daemon', url: 'https://www.amazon.com/DAEMON-Daniel-Suarez/dp/0451228731' }]
      }, {
        label: 'Creator',
        field_values: [{ text: 'Daniel Suarez' }]
      }, {
        label: 'Fiscal Sponsor',
        field_values: [{ text: 'Grant provided to the Minnesota Digital Library Coalition through the Library Services and Technology Act (LSTA) and the State Library Services and School Technology unit of the Minnesota Department of Education' }]
      }]
    }, {
      focus: false,
      type: 'citation',
      label: 'Citation',
      fields: {
        mappings: [{}],
        field_values: {
          creator: 'Fred',
          ref_name: 'University of Minnesota',
          creation_date: '09/01/2001',
          title: 'Fred and his dog',
          type: 'image',
          description: 'A boy and his dog',
          subject: ['dogs', 'cats'],
          contributing_organization: 'Fred and co',
          url: 'http://www.example.com/fred',
          current_date: Date.now()
        }
      }
    }, {
      focus: false,
      type: 'download',
      label: 'Download',
      fields: [{
        thumbnail: 'http://lib-mdl-dev.oit.umn.edu/thumbnails/penn:89',
        sources: [{
          label: 'Download (75x75)',
          src: 'http://reflections.mndigital.org/digital/iiif/penn/89/full/75,75/0/default.jpg'
        }, {
          label: 'Download (150x150)',
          src: 'http://reflections.mndigital.org/digital/iiif/penn/89/full/150,150/0/default.jpg'
        }, {
          label: 'Download (800x800)',
          src: 'http://reflections.mndigital.org/digital/iiif/penn/89/full/800,800/0/default.jpg'
        }]
      }, {
        thumbnail: 'http://lib-mdl-dev.oit.umn.edu/thumbnails/penn:152',
        sources: [{
          label: 'Download (75x75)',
          src: 'http://reflections.mndigital.org/digital/iiif/penn/152/full/75,75/0/default.jpg'
        }, {
          label: 'Download (150x150)',
          src: 'http://reflections.mndigital.org/digital/iiif/penn/152/full/150,150/0/default.jpg'
        }, {
          label: 'Download (800x800)',
          src: 'http://reflections.mndigital.org/digital/iiif/penn/152/full/800,800/0/default.jpg'
        }]
      }, {
        thumbnail: 'http://lib-mdl-dev.oit.umn.edu/thumbnails/nemhc:4971',
        sources: [{
          label: 'Download (75x75)',
          src: 'http://reflections.mndigital.org/digital/iiif/nemhc/4971/full/75,75/0/default.jpg'
        }, {
          label: 'Download (150x150)',
          src: 'http://reflections.mndigital.org/digital/iiif/nemhc/4971/full/150,150/0/default.jpg'
        }, {
          label: 'Download (800x800)',
          src: 'http://reflections.mndigital.org/digital/iiif/nemhc/4971/full/800,800/0/default.jpg'
        }]
      }]
    }, {
      focus: false,
      type: 'transcript',
      label: 'Transcript',
      transcript: 'This is a transcript of something or other'
    }];
    return _react2.default.createElement(
      'div',
      null,
      _react2.default.createElement(_reactCitation2.default, { items: items })
    );
  }
});

_reactDom2.default.render(_react2.default.createElement(App, null), document.getElementById('app'));

},{"react":undefined,"react-citation":undefined,"react-dom":undefined}]},{},[1]);
