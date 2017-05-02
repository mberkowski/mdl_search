import Needle from './needle.js.es6';
import DrawMap from './draw_map.js.es6';

export default function drawMapWithPopup(title, id, type, coordinates, nearbyLocations, mapName, initialPath) {
  DrawMap(coordinates, nearbyLocations, mapName)
    .pinIt(coordinates, id, title, type, initialPath).openPopup();
}
