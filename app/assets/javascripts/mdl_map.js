var LinkedThumbnail = window.LinkedThumbnail = require('./linked_thumbnail.js.es6');

var DrawMap = window.DrawMap = global.DrawMap = function drawmap(title, id, type, coordinates, nearby_locations) {
  let map = L.map('full_record_map').setView(coordinates, 10);
  nearby_locations.forEach(function(location) {
      L.marker(location['coordinates_llsi'].split(','))
        .bindPopup(LinkedThumbnail(location['id'], location['title_ssi'], location['type']))
        .addTo(map);
  });
  L.marker(coordinates).addTo(map)
    .bindPopup(LinkedThumbnail(id, title, type)).openPopup();
  L.tileLayer('https://api.mapbox.com/styles/v1/libsys/{id}/tiles/256/{z}/{x}/{y}?access_token={accessToken}', {
          attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
          center: coordinates,
          id: 'cj17xqnh8003j2rquui5gm3ar',
          accessToken: 'pk.eyJ1IjoibGlic3lzIiwiYSI6Iks3SXpZUTQifQ.mVUUXOBDusaTEnEsSO3yAQ'
      }).addTo(map);

  function LinkedThumbnail(id, title, type) {
    return [
            `${RecordLink(id, "thumbnail", Thumbnail(id, type))}`,
             `${RecordLink(id, title, title)}`
           ].join('')
  }

  function Thumbnail(id, type) {
    return `<div><img src="/thumbnails/${id}/${type}" /></div>`
  }

  function RecordLink(id, alt, data) {
    return `<a href="/catalog/${id}" alt="${alt}">${data}</a>`
  }
}