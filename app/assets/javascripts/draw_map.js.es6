import Needle from './needle.js.es6';


function blerg() {
}


function reDrawMap(coordinates, needle) {
  const coords = `${coordinates.lat},${coordinates.lng}`.replace(/\./g, '+');
  $.ajax({
    url: `/nearbys/${coords}/10`,
    jsonp: 'callback',
    dataType: 'jsonp',
    success: function( nearbyLocations ) {
      nearbyLocations.forEach((location) => {
        needle.pinIt(location.coordinates_llsi.split(','),
                     location.id,
                     location.title_ssi,
                     location.type);
      });
    },
     error: function(xhr, type, exception) {
      console(`${type} ---- ${exception}`);
    }
  });
}

export default function drawMap(coordinates, nearbyLocations, mapName) {
  const needle = new Needle(coordinates, mapName);
  nearbyLocations.forEach((location) => {
    needle.pinIt(location.coordinates_llsi.split(','),
                 location.id,
                 location.title_ssi,
                 location.type);
  });
  needle.onMove(reDrawMap, needle);
  return needle;
}

