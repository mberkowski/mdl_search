import DrawMap from './draw_map.js.es6';
import LinkedThumbnail from './linked_thumbnail.js.es6';

export default function drawMapWithPopup(
  title,
  id,
  type,
  coordinates,
  nearbyLocations,
  mapName,
  initialPath,
) {
  const pinHTML = new LinkedThumbnail(
    title,
    id,
    type,
    initialPath).toHtml();
  DrawMap(coordinates, nearbyLocations, mapName)
    .pinIt(coordinates, pinHTML).openPopup();
}
