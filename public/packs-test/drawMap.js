var MDLdrawMap =
/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "/packs-test/";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 91);
/******/ })
/************************************************************************/
/******/ ({

/***/ 53:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (immutable) */ __webpack_exports__["a"] = drawMap;
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__needle_js__ = __webpack_require__(92);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__linked_thumbnail_js__ = __webpack_require__(54);



function pinHTML(location) {
  return new __WEBPACK_IMPORTED_MODULE_1__linked_thumbnail_js__["a" /* default */](location.title_ssi, location.id, location.type_ssi).toHtml();
}

function reDrawMap(coordinates, needle) {
  var coords = (coordinates.lat + ',' + coordinates.lng).replace(/\./g, '+');
  $.ajax({
    url: '/nearbys/' + coords,
    jsonp: 'callback',
    dataType: 'jsonp',
    success: function success(nearbyLocations) {
      nearbyLocations.forEach(function (location) {
        needle.pinIt(location.coordinates_llsi.split(','), pinHTML(location));
      });
    },
    error: function error(xhr, type, exception) {
      console(type + ' ---- ' + exception);
    }
  });
}

function drawMap(coordinates, nearbyLocations, mapName) {
  var needle = new __WEBPACK_IMPORTED_MODULE_0__needle_js__["a" /* default */](coordinates, mapName);
  nearbyLocations.forEach(function (location) {
    needle.pinIt(location.coordinates_llsi.split(','), pinHTML(location), location.title_ssi.substring(0, 50) + '...');
  });
  needle.onMove(reDrawMap, needle);
  return needle;
}

/***/ }),

/***/ 54:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
var _createClass = function () {
  function defineProperties(target, props) {
    for (var i = 0; i < props.length; i++) {
      var descriptor = props[i];descriptor.enumerable = descriptor.enumerable || false;descriptor.configurable = true;if ("value" in descriptor) descriptor.writable = true;Object.defineProperty(target, descriptor.key, descriptor);
    }
  }return function (Constructor, protoProps, staticProps) {
    if (protoProps) defineProperties(Constructor.prototype, protoProps);if (staticProps) defineProperties(Constructor, staticProps);return Constructor;
  };
}();

function _classCallCheck(instance, Constructor) {
  if (!(instance instanceof Constructor)) {
    throw new TypeError("Cannot call a class as a function");
  }
}

var LinkedThumbnail = function () {
  function LinkedThumbnail(title, id, type) {
    _classCallCheck(this, LinkedThumbnail);

    this.title = title;
    this.id = id;
    this.type = type;
    this.toHtml = this.toHtml.bind(this);
    this.thumbnail = this.thumbnail.bind(this);
  }

  _createClass(LinkedThumbnail, [{
    key: 'toHtml',
    value: function toHtml() {
      return ['' + this.recordLink('thumbnail', this.thumbnail()), '' + this.recordLink(this.title, this.title)].join(' ');
    }
  }, {
    key: 'recordLink',
    value: function recordLink(alt, data) {
      return '<a href="/catalog/' + this.id + '?pn=false" alt="' + alt + '" class="map-pin-link">' + data + '</a>';
    }
  }, {
    key: 'thumbnail',
    value: function thumbnail() {
      return '<div><img alt="' + this.title + '" src="/thumbnails/' + this.id + '/' + this.type + '" /></div>';
    }
  }]);

  return LinkedThumbnail;
}();

/* harmony default export */ __webpack_exports__["a"] = (LinkedThumbnail);

/***/ }),

/***/ 91:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
Object.defineProperty(__webpack_exports__, "__esModule", { value: true });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__draw_map__ = __webpack_require__(53);
/* harmony reexport (binding) */ __webpack_require__.d(__webpack_exports__, "drawMap", function() { return __WEBPACK_IMPORTED_MODULE_0__draw_map__["a"]; });
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__draw_map_with_popup__ = __webpack_require__(93);
/* harmony reexport (binding) */ __webpack_require__.d(__webpack_exports__, "drawMapWithPopup", function() { return __WEBPACK_IMPORTED_MODULE_1__draw_map_with_popup__["a"]; });



/***/ }),

/***/ 92:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
var _createClass = function () {
  function defineProperties(target, props) {
    for (var i = 0; i < props.length; i++) {
      var descriptor = props[i];descriptor.enumerable = descriptor.enumerable || false;descriptor.configurable = true;if ("value" in descriptor) descriptor.writable = true;Object.defineProperty(target, descriptor.key, descriptor);
    }
  }return function (Constructor, protoProps, staticProps) {
    if (protoProps) defineProperties(Constructor.prototype, protoProps);if (staticProps) defineProperties(Constructor, staticProps);return Constructor;
  };
}();

function _classCallCheck(instance, Constructor) {
  if (!(instance instanceof Constructor)) {
    throw new TypeError("Cannot call a class as a function");
  }
}

// "[Pine] Needle," a Leaflet wrapper
var Needle = function () {
  _createClass(Needle, null, [{
    key: 'config',
    value: function config(coordinates) {
      return {
        attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors,<a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
        center: coordinates,
        id: 'cj17xqnh8003j2rquui5gm3ar',
        minZoom: 7,
        accessToken: 'pk.eyJ1IjoibGlic3lzIiwiYSI6Iks3SXpZUTQifQ.mVUUXOBDusaTEnEsSO3yAQ'
      };
    }
  }]);

  function Needle(coordinates) {
    var mapName = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : 'mdl_map';

    _classCallCheck(this, Needle);

    this.coordinates = coordinates;
    this.mapName = mapName;
    this._map = this._map.bind(this);
    this._tileIt = this._tileIt.bind(this);
    this.pinIt = this.pinIt.bind(this);
    this._attachMap = this._attachMap.bind(this);
    this._attachMap();
    this.onMove = this.onMove.bind(this);
  }

  _createClass(Needle, [{
    key: 'onMove',
    value: function onMove(handler) {
      for (var _len = arguments.length, args = Array(_len > 1 ? _len - 1 : 0), _key = 1; _key < _len; _key++) {
        args[_key - 1] = arguments[_key];
      }

      this.map.on('dragend', function (e) {
        handler.apply(undefined, [e.target.getCenter()].concat(args));
      });
    }
  }, {
    key: 'pinIt',
    value: function pinIt(coordinates, pinHTML, altText) {
      return L.marker(coordinates, { alt: 'Pin for: ' + altText }).bindPopup(pinHTML).addTo(this.map);
    }

    // Initialize the map and attach it to the DOM

  }, {
    key: '_attachMap',
    value: function _attachMap() {
      this.map = this._map();
      this._tileIt();
    }
  }, {
    key: '_tileIt',
    value: function _tileIt() {
      L.tileLayer('https://api.mapbox.com/styles/v1/libsys/{id}/tiles/256/{z}/{x}/{y}?access_token={accessToken}', Needle.config(this.coordinates)).addTo(this.map);
    }
  }, {
    key: '_map',
    value: function _map() {
      if (!this.maplib) {
        this.maplib = L.map(this.mapName).setView(this.coordinates, 10);
      }
      return this.maplib;
    }
  }]);

  return Needle;
}();

/* harmony default export */ __webpack_exports__["a"] = (Needle);

/***/ }),

/***/ 93:
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
/* harmony export (immutable) */ __webpack_exports__["a"] = drawMapWithPopup;
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_0__draw_map_js__ = __webpack_require__(53);
/* harmony import */ var __WEBPACK_IMPORTED_MODULE_1__linked_thumbnail_js__ = __webpack_require__(54);



function drawMapWithPopup(title, id, type, coordinates, nearbyLocations, mapName) {
  var pinHTML = new __WEBPACK_IMPORTED_MODULE_1__linked_thumbnail_js__["a" /* default */](title, id, type).toHtml();
  Object(__WEBPACK_IMPORTED_MODULE_0__draw_map_js__["a" /* default */])(coordinates, nearbyLocations, mapName).pinIt(coordinates, pinHTML).openPopup();
}

/***/ })

/******/ });