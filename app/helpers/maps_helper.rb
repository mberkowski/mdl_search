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
end