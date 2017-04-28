import LinkedThumbnail from './linked_thumbnail.js.es6';
// "[Pine] Needle," a Leaflet wrapper
export default class Needle {
  static config(coordinates) {
    return {
      attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors,<a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
      center: coordinates,
      id: 'cj17xqnh8003j2rquui5gm3ar',
      accessToken: 'pk.eyJ1IjoibGlic3lzIiwiYSI6Iks3SXpZUTQifQ.mVUUXOBDusaTEnEsSO3yAQ',
    };
  }

  constructor(coordinates, mapName = 'mdl_map') {
    this.coordinates = coordinates;
    this.mapName = mapName;
    this._map = this._map.bind(this);
    this._tileIt = this._tileIt.bind(this);
    this.pinIt = this.pinIt.bind(this);
    this._attachMap = this._attachMap.bind(this);
    this._attachMap();
  }

  pinIt(coordinates, id, title, type) {
    return (L.marker(coordinates)
      .bindPopup(new LinkedThumbnail(title, id, type).toHtml())
      .addTo(this._map));
  }

  // Initialize the map and attach it to the DOM
  _attachMap() {
    this._map = this._map();
    this._tileIt();
  }

  _tileIt() {
    L.tileLayer('https://api.mapbox.com/styles/v1/libsys/{id}/tiles/256/{z}/{x}/{y}?access_token={accessToken}',
      Needle.config(this.coordinates)).addTo(this._map);
  }

  _map() {
    if (!this.maplib) {
      this.maplib = L.map(this.mapName).setView(this.coordinates, 10);
    }
    return this.maplib;
  }
}
