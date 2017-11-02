import DrawMap from './draw_map.js';
import LinkedThumbnail from './linked_thumbnail.js';

export default function drawMapWithPopup(
  title,
  id,
  type,
  coordinates,
  nearbyLocations,
  mapName,
) {
  const pinHTML = new LinkedThumbnail(
    title,
    id,
    type).toHtml();
  DrawMap(coordinates, nearbyLocations, mapName)
    .pinIt(coordinates, pinHTML).openPopup();
}
