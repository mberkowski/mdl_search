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

},{"react":undefined,"react-citation":undefined,"react-dom":undefined}]},{},[1])
//# sourceMappingURL=data:application/json;charset:utf-8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIm5vZGVfbW9kdWxlcy9icm93c2VyLXBhY2svX3ByZWx1ZGUuanMiLCJleGFtcGxlL3NyYy9leGFtcGxlLmpzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiJBQUFBOzs7QUNBQTs7OztBQUNBOzs7O0FBQ0E7Ozs7OztBQUVBLElBQUksT0FBTyxJQUFJLElBQUosRUFBWDs7QUFFQSxJQUFJLE1BQU0sZ0JBQU0sV0FBTixDQUFrQjtBQUFBO0FBQzNCLFFBRDJCLG9CQUNqQjtBQUNQLFFBQU0sUUFDRixDQUNFO0FBQ0UsYUFBTyxJQURUO0FBRUUsWUFBTSxTQUZSO0FBR0UsYUFBTyxTQUhUO0FBSUUsY0FDRSxDQUNFO0FBQ0UsZUFBTyxPQURUO0FBRUUsc0JBQWMsQ0FDWixFQUFDLE1BQU0sUUFBUCxFQUFpQixLQUFLLDJEQUF0QixFQURZO0FBRmhCLE9BREYsRUFPRTtBQUNFLGVBQU8sU0FEVDtBQUVFLHNCQUFjLENBQ1osRUFBQyxNQUFNLGVBQVAsRUFEWTtBQUZoQixPQVBGLEVBYUU7QUFDRSxlQUFPLGdCQURUO0FBRUUsc0JBQWMsQ0FDWixFQUFDLE1BQU0scU5BQVAsRUFEWTtBQUZoQixPQWJGO0FBTEosS0FERixFQTJCRTtBQUNFLGFBQU8sS0FEVDtBQUVFLFlBQU0sVUFGUjtBQUdFLGFBQU8sVUFIVDtBQUlFLGNBQ0U7QUFDRSxrQkFBVSxDQUFDLEVBQUQsQ0FEWjtBQUVFLHNCQUNFO0FBQ0UsbUJBQVMsTUFEWDtBQUVFLG9CQUFVLHlCQUZaO0FBR0UseUJBQWUsWUFIakI7QUFJRSxpQkFBTyxrQkFKVDtBQUtFLGdCQUFNLE9BTFI7QUFNRSx1QkFBYSxtQkFOZjtBQU9FLG1CQUFTLENBQUMsTUFBRCxFQUFTLE1BQVQsQ0FQWDtBQVFFLHFDQUEyQixhQVI3QjtBQVNFLGVBQUssNkJBVFA7QUFVRSx3QkFBYyxLQUFLLEdBQUw7QUFWaEI7QUFISjtBQUxKLEtBM0JGLEVBaURJO0FBQ0UsYUFBTyxLQURUO0FBRUUsWUFBTSxVQUZSO0FBR0UsYUFBTyxVQUhUO0FBSUUsY0FDRSxDQUNFO0FBQ0UsbUJBQVcsbURBRGI7QUFFRSxpQkFBUyxDQUNQO0FBQ0UsaUJBQU8sa0JBRFQ7QUFFRSxlQUFLO0FBRlAsU0FETyxFQUtQO0FBQ0UsaUJBQU8sb0JBRFQ7QUFFRSxlQUFLO0FBRlAsU0FMTyxFQVNQO0FBQ0UsaUJBQU8sb0JBRFQ7QUFFRSxlQUFLO0FBRlAsU0FUTztBQUZYLE9BREYsRUFrQkU7QUFDRSxtQkFBVyxvREFEYjtBQUVFLGlCQUFTLENBQ1A7QUFDRSxpQkFBTyxrQkFEVDtBQUVFLGVBQUs7QUFGUCxTQURPLEVBS1A7QUFDRSxpQkFBTyxvQkFEVDtBQUVFLGVBQUs7QUFGUCxTQUxPLEVBU1A7QUFDRSxpQkFBTyxvQkFEVDtBQUVFLGVBQUs7QUFGUCxTQVRPO0FBRlgsT0FsQkYsRUFtQ0U7QUFDRSxtQkFBVyxzREFEYjtBQUVFLGlCQUFTLENBQ1A7QUFDRSxpQkFBTyxrQkFEVDtBQUVFLGVBQUs7QUFGUCxTQURPLEVBS1A7QUFDRSxpQkFBTyxvQkFEVDtBQUVFLGVBQUs7QUFGUCxTQUxPLEVBU1A7QUFDRSxpQkFBTyxvQkFEVDtBQUVFLGVBQUs7QUFGUCxTQVRPO0FBRlgsT0FuQ0Y7QUFMSixLQWpESixFQTRHTTtBQUNFLGFBQU8sS0FEVDtBQUVFLFlBQU0sWUFGUjtBQUdFLGFBQU8sWUFIVDtBQUlFLGtCQUFZO0FBSmQsS0E1R04sQ0FESjtBQW9IRixXQUFRO0FBQUE7QUFBQTtBQUFLLCtEQUFlLE9BQU8sS0FBdEI7QUFBTCxLQUFSO0FBRUE7QUF4SDBCLENBQWxCLENBQVY7O0FBMkhBLG1CQUFTLE1BQVQsQ0FBZ0IsOEJBQUMsR0FBRCxPQUFoQixFQUF5QixTQUFTLGNBQVQsQ0FBd0IsS0FBeEIsQ0FBekIiLCJmaWxlIjoiZ2VuZXJhdGVkLmpzIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXNDb250ZW50IjpbIihmdW5jdGlvbiBlKHQsbixyKXtmdW5jdGlvbiBzKG8sdSl7aWYoIW5bb10pe2lmKCF0W29dKXt2YXIgYT10eXBlb2YgcmVxdWlyZT09XCJmdW5jdGlvblwiJiZyZXF1aXJlO2lmKCF1JiZhKXJldHVybiBhKG8sITApO2lmKGkpcmV0dXJuIGkobywhMCk7dmFyIGY9bmV3IEVycm9yKFwiQ2Fubm90IGZpbmQgbW9kdWxlICdcIitvK1wiJ1wiKTt0aHJvdyBmLmNvZGU9XCJNT0RVTEVfTk9UX0ZPVU5EXCIsZn12YXIgbD1uW29dPXtleHBvcnRzOnt9fTt0W29dWzBdLmNhbGwobC5leHBvcnRzLGZ1bmN0aW9uKGUpe3ZhciBuPXRbb11bMV1bZV07cmV0dXJuIHMobj9uOmUpfSxsLGwuZXhwb3J0cyxlLHQsbixyKX1yZXR1cm4gbltvXS5leHBvcnRzfXZhciBpPXR5cGVvZiByZXF1aXJlPT1cImZ1bmN0aW9uXCImJnJlcXVpcmU7Zm9yKHZhciBvPTA7bzxyLmxlbmd0aDtvKyspcyhyW29dKTtyZXR1cm4gc30pIiwiaW1wb3J0IFJlYWN0IGZyb20gJ3JlYWN0J1xuaW1wb3J0IFJlYWN0RE9NIGZyb20gJ3JlYWN0LWRvbSdcbmltcG9ydCBSZWFjdENpdGF0aW9uICBmcm9tICdyZWFjdC1jaXRhdGlvbidcblxubGV0IGRhdGUgPSBuZXcgRGF0ZSgpO1xuXG52YXIgQXBwID0gUmVhY3QuY3JlYXRlQ2xhc3Moe1xuXHRyZW5kZXIgKCkge1xuICAgIGNvbnN0IGl0ZW1zID0gXG4gICAgICAgIFtcbiAgICAgICAgICB7XG4gICAgICAgICAgICBmb2N1czogdHJ1ZSxcbiAgICAgICAgICAgIHR5cGU6ICdkZXRhaWxzJyxcbiAgICAgICAgICAgIGxhYmVsOiAnRGV0YWlscycsXG4gICAgICAgICAgICBmaWVsZHM6IFxuICAgICAgICAgICAgICBbXG4gICAgICAgICAgICAgICAge1xuICAgICAgICAgICAgICAgICAgbGFiZWw6ICdUaXRsZScsXG4gICAgICAgICAgICAgICAgICBmaWVsZF92YWx1ZXM6IFtcbiAgICAgICAgICAgICAgICAgICAge3RleHQ6ICdEYWVtb24nLCB1cmw6ICdodHRwczovL3d3dy5hbWF6b24uY29tL0RBRU1PTi1EYW5pZWwtU3VhcmV6L2RwLzA0NTEyMjg3MzEnfVxuICAgICAgICAgICAgICAgICAgXVxuICAgICAgICAgICAgICAgIH0sXG4gICAgICAgICAgICAgICAge1xuICAgICAgICAgICAgICAgICAgbGFiZWw6ICdDcmVhdG9yJyxcbiAgICAgICAgICAgICAgICAgIGZpZWxkX3ZhbHVlczogW1xuICAgICAgICAgICAgICAgICAgICB7dGV4dDogJ0RhbmllbCBTdWFyZXonfVxuICAgICAgICAgICAgICAgICAgXVxuICAgICAgICAgICAgICAgIH0sXG4gICAgICAgICAgICAgICAge1xuICAgICAgICAgICAgICAgICAgbGFiZWw6ICdGaXNjYWwgU3BvbnNvcicsXG4gICAgICAgICAgICAgICAgICBmaWVsZF92YWx1ZXM6IFtcbiAgICAgICAgICAgICAgICAgICAge3RleHQ6ICdHcmFudCBwcm92aWRlZCB0byB0aGUgTWlubmVzb3RhIERpZ2l0YWwgTGlicmFyeSBDb2FsaXRpb24gdGhyb3VnaCB0aGUgTGlicmFyeSBTZXJ2aWNlcyBhbmQgVGVjaG5vbG9neSBBY3QgKExTVEEpIGFuZCB0aGUgU3RhdGUgTGlicmFyeSBTZXJ2aWNlcyBhbmQgU2Nob29sIFRlY2hub2xvZ3kgdW5pdCBvZiB0aGUgTWlubmVzb3RhIERlcGFydG1lbnQgb2YgRWR1Y2F0aW9uJ31cbiAgICAgICAgICAgICAgICAgIF1cbiAgICAgICAgICAgICAgICB9XG4gICAgICAgICAgICAgIF1cbiAgICAgICAgICAgIH0sXG4gICAgICAgICAge1xuICAgICAgICAgICAgZm9jdXM6IGZhbHNlLFxuICAgICAgICAgICAgdHlwZTogJ2NpdGF0aW9uJyxcbiAgICAgICAgICAgIGxhYmVsOiAnQ2l0YXRpb24nLFxuICAgICAgICAgICAgZmllbGRzOiBcbiAgICAgICAgICAgICAge1xuICAgICAgICAgICAgICAgIG1hcHBpbmdzOiBbe31dLFxuICAgICAgICAgICAgICAgIGZpZWxkX3ZhbHVlczpcbiAgICAgICAgICAgICAgICAgIHtcbiAgICAgICAgICAgICAgICAgICAgY3JlYXRvcjogJ0ZyZWQnLFxuICAgICAgICAgICAgICAgICAgICByZWZfbmFtZTogJ1VuaXZlcnNpdHkgb2YgTWlubmVzb3RhJyxcbiAgICAgICAgICAgICAgICAgICAgY3JlYXRpb25fZGF0ZTogJzA5LzAxLzIwMDEnLFxuICAgICAgICAgICAgICAgICAgICB0aXRsZTogJ0ZyZWQgYW5kIGhpcyBkb2cnLFxuICAgICAgICAgICAgICAgICAgICB0eXBlOiAnaW1hZ2UnLFxuICAgICAgICAgICAgICAgICAgICBkZXNjcmlwdGlvbjogJ0EgYm95IGFuZCBoaXMgZG9nJyxcbiAgICAgICAgICAgICAgICAgICAgc3ViamVjdDogWydkb2dzJywgJ2NhdHMnXSxcbiAgICAgICAgICAgICAgICAgICAgY29udHJpYnV0aW5nX29yZ2FuaXphdGlvbjogJ0ZyZWQgYW5kIGNvJyxcbiAgICAgICAgICAgICAgICAgICAgdXJsOiAnaHR0cDovL3d3dy5leGFtcGxlLmNvbS9mcmVkJyxcbiAgICAgICAgICAgICAgICAgICAgY3VycmVudF9kYXRlOiBEYXRlLm5vdygpXG4gICAgICAgICAgICAgICAgICB9XG4gICAgICAgICAgICAgIH1cbiAgICAgICAgICAgIH0sXG4gICAgICAgICAgICB7XG4gICAgICAgICAgICAgIGZvY3VzOiBmYWxzZSxcbiAgICAgICAgICAgICAgdHlwZTogJ2Rvd25sb2FkJyxcbiAgICAgICAgICAgICAgbGFiZWw6ICdEb3dubG9hZCcsXG4gICAgICAgICAgICAgIGZpZWxkczogXG4gICAgICAgICAgICAgICAgW1xuICAgICAgICAgICAgICAgICAgeyBcbiAgICAgICAgICAgICAgICAgICAgdGh1bWJuYWlsOiAnaHR0cDovL2xpYi1tZGwtZGV2Lm9pdC51bW4uZWR1L3RodW1ibmFpbHMvcGVubjo4OScsXG4gICAgICAgICAgICAgICAgICAgIHNvdXJjZXM6IFtcbiAgICAgICAgICAgICAgICAgICAgICB7XG4gICAgICAgICAgICAgICAgICAgICAgICBsYWJlbDogJ0Rvd25sb2FkICg3NXg3NSknLFxuICAgICAgICAgICAgICAgICAgICAgICAgc3JjOiAnaHR0cDovL3JlZmxlY3Rpb25zLm1uZGlnaXRhbC5vcmcvZGlnaXRhbC9paWlmL3Blbm4vODkvZnVsbC83NSw3NS8wL2RlZmF1bHQuanBnJ1xuICAgICAgICAgICAgICAgICAgICAgIH0sXG4gICAgICAgICAgICAgICAgICAgICAge1xuICAgICAgICAgICAgICAgICAgICAgICAgbGFiZWw6ICdEb3dubG9hZCAoMTUweDE1MCknLFxuICAgICAgICAgICAgICAgICAgICAgICAgc3JjOiAnaHR0cDovL3JlZmxlY3Rpb25zLm1uZGlnaXRhbC5vcmcvZGlnaXRhbC9paWlmL3Blbm4vODkvZnVsbC8xNTAsMTUwLzAvZGVmYXVsdC5qcGcnXG4gICAgICAgICAgICAgICAgICAgICAgfSxcbiAgICAgICAgICAgICAgICAgICAgICB7XG4gICAgICAgICAgICAgICAgICAgICAgICBsYWJlbDogJ0Rvd25sb2FkICg4MDB4ODAwKScsXG4gICAgICAgICAgICAgICAgICAgICAgICBzcmM6ICdodHRwOi8vcmVmbGVjdGlvbnMubW5kaWdpdGFsLm9yZy9kaWdpdGFsL2lpaWYvcGVubi84OS9mdWxsLzgwMCw4MDAvMC9kZWZhdWx0LmpwZydcbiAgICAgICAgICAgICAgICAgICAgICB9XG4gICAgICAgICAgICAgICAgICAgIF1cbiAgICAgICAgICAgICAgICAgIH0sXG4gICAgICAgICAgICAgICAgICB7IFxuICAgICAgICAgICAgICAgICAgICB0aHVtYm5haWw6ICdodHRwOi8vbGliLW1kbC1kZXYub2l0LnVtbi5lZHUvdGh1bWJuYWlscy9wZW5uOjE1MicsXG4gICAgICAgICAgICAgICAgICAgIHNvdXJjZXM6IFtcbiAgICAgICAgICAgICAgICAgICAgICB7XG4gICAgICAgICAgICAgICAgICAgICAgICBsYWJlbDogJ0Rvd25sb2FkICg3NXg3NSknLFxuICAgICAgICAgICAgICAgICAgICAgICAgc3JjOiAnaHR0cDovL3JlZmxlY3Rpb25zLm1uZGlnaXRhbC5vcmcvZGlnaXRhbC9paWlmL3Blbm4vMTUyL2Z1bGwvNzUsNzUvMC9kZWZhdWx0LmpwZydcbiAgICAgICAgICAgICAgICAgICAgICB9LFxuICAgICAgICAgICAgICAgICAgICAgIHtcbiAgICAgICAgICAgICAgICAgICAgICAgIGxhYmVsOiAnRG93bmxvYWQgKDE1MHgxNTApJyxcbiAgICAgICAgICAgICAgICAgICAgICAgIHNyYzogJ2h0dHA6Ly9yZWZsZWN0aW9ucy5tbmRpZ2l0YWwub3JnL2RpZ2l0YWwvaWlpZi9wZW5uLzE1Mi9mdWxsLzE1MCwxNTAvMC9kZWZhdWx0LmpwZydcbiAgICAgICAgICAgICAgICAgICAgICB9LFxuICAgICAgICAgICAgICAgICAgICAgIHtcbiAgICAgICAgICAgICAgICAgICAgICAgIGxhYmVsOiAnRG93bmxvYWQgKDgwMHg4MDApJyxcbiAgICAgICAgICAgICAgICAgICAgICAgIHNyYzogJ2h0dHA6Ly9yZWZsZWN0aW9ucy5tbmRpZ2l0YWwub3JnL2RpZ2l0YWwvaWlpZi9wZW5uLzE1Mi9mdWxsLzgwMCw4MDAvMC9kZWZhdWx0LmpwZydcbiAgICAgICAgICAgICAgICAgICAgICB9XG4gICAgICAgICAgICAgICAgICAgIF1cbiAgICAgICAgICAgICAgICAgIH0sXG4gICAgICAgICAgICAgICAgICB7IFxuICAgICAgICAgICAgICAgICAgICB0aHVtYm5haWw6ICdodHRwOi8vbGliLW1kbC1kZXYub2l0LnVtbi5lZHUvdGh1bWJuYWlscy9uZW1oYzo0OTcxJyxcbiAgICAgICAgICAgICAgICAgICAgc291cmNlczogW1xuICAgICAgICAgICAgICAgICAgICAgIHtcbiAgICAgICAgICAgICAgICAgICAgICAgIGxhYmVsOiAnRG93bmxvYWQgKDc1eDc1KScsXG4gICAgICAgICAgICAgICAgICAgICAgICBzcmM6ICdodHRwOi8vcmVmbGVjdGlvbnMubW5kaWdpdGFsLm9yZy9kaWdpdGFsL2lpaWYvbmVtaGMvNDk3MS9mdWxsLzc1LDc1LzAvZGVmYXVsdC5qcGcnXG4gICAgICAgICAgICAgICAgICAgICAgfSxcbiAgICAgICAgICAgICAgICAgICAgICB7XG4gICAgICAgICAgICAgICAgICAgICAgICBsYWJlbDogJ0Rvd25sb2FkICgxNTB4MTUwKScsXG4gICAgICAgICAgICAgICAgICAgICAgICBzcmM6ICdodHRwOi8vcmVmbGVjdGlvbnMubW5kaWdpdGFsLm9yZy9kaWdpdGFsL2lpaWYvbmVtaGMvNDk3MS9mdWxsLzE1MCwxNTAvMC9kZWZhdWx0LmpwZydcbiAgICAgICAgICAgICAgICAgICAgICB9LFxuICAgICAgICAgICAgICAgICAgICAgIHtcbiAgICAgICAgICAgICAgICAgICAgICAgIGxhYmVsOiAnRG93bmxvYWQgKDgwMHg4MDApJyxcbiAgICAgICAgICAgICAgICAgICAgICAgIHNyYzogJ2h0dHA6Ly9yZWZsZWN0aW9ucy5tbmRpZ2l0YWwub3JnL2RpZ2l0YWwvaWlpZi9uZW1oYy80OTcxL2Z1bGwvODAwLDgwMC8wL2RlZmF1bHQuanBnJ1xuICAgICAgICAgICAgICAgICAgICAgIH1cbiAgICAgICAgICAgICAgICAgICAgXVxuICAgICAgICAgICAgICAgICAgfVxuICAgICAgICAgICAgICAgIF1cbiAgICAgICAgICAgICAgfSxcbiAgICAgICAgICAgICAge1xuICAgICAgICAgICAgICAgIGZvY3VzOiBmYWxzZSxcbiAgICAgICAgICAgICAgICB0eXBlOiAndHJhbnNjcmlwdCcsXG4gICAgICAgICAgICAgICAgbGFiZWw6ICdUcmFuc2NyaXB0JyxcbiAgICAgICAgICAgICAgICB0cmFuc2NyaXB0OiAnVGhpcyBpcyBhIHRyYW5zY3JpcHQgb2Ygc29tZXRoaW5nIG9yIG90aGVyJ1xuICAgICAgICAgICAgICB9XG4gICAgICAgICAgXVxuXHRcdHJldHVybiAoPGRpdj48UmVhY3RDaXRhdGlvbiBpdGVtcz17aXRlbXN9IC8+PC9kaXY+XG5cdFx0KTtcblx0fVxufSk7XG5cblJlYWN0RE9NLnJlbmRlcig8QXBwIC8+LCBkb2N1bWVudC5nZXRFbGVtZW50QnlJZCgnYXBwJykpO1xuIl19
