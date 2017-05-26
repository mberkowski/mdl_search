module MapsHelper

  def coordinates_json(coordinates)
    raw coordinates.split(',').to_json
  end

  def nearby_json(coordinates)
    raw Nearby.search(q: '*:*', pt: coordinates, d: 25).to_json
  end

  def title
    @document['title_ssi']
  end

  def type
    @document['type_ssi']
  end

  def id
    @document['id']
  end

  def random_coordinates
    [
      '44.96194,-93.26694',
      '46.78111, -92.11806',
      '44.01361, -92.47583',
      '45.87417, -95.375',
      '45.87417, -95.375',
      '45.87417, -95.375',
      '45.87417, -95.375',
      '46.86472, -96.75583',
      '47.51583, -92.50694',
      '43.86944, -95.11833'
    ].sample
  end
end