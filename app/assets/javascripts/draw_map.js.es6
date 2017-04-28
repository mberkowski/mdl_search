import Needle from './needle.js.es6';

export default function drawmap(title, id, type, coordinates, nearbyLocations, mapName) {
  const needle = new Needle(coordinates, mapName);
  nearbyLocations.forEach((location) => {
    needle.pinIt(location.coordinates_llsi.split(','),
                 location.id,
                 location.title_ssi,
                 location.type);
  });
  needle.pinIt(coordinates, id, title, type).openPopup();
}
