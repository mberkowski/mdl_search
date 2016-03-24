require 'net/http'

class ContentdmIIIF
  attr_accessor :collection, :id, :scale, :width, :height
  def initialize(collection, id, scale = 100, width = 10000, height = 10000)
    @collection = collection
    @id = id
    @scale = scale
    @width = width
    @height = height
  end

  def load
    File.file?(local_filepath) ? local_file : cache_remote_file
  end

  def location
    "#{base_url}/#{params}"
  end

  private

  def cache_remote_file
    File.open(local_filepath, 'wb') { |file| file.write(remote_file) }
    remote_file
  end

  def remote_file
    @remote_file ||= Net::HTTP.get_response(URI(location)).body
  end

  def base_url
    'http://reflections.mndigital.org/utils/ajaxhelper'
  end

  def params
    "?CISOROOT=#{collection}" \
    "&CISOPTR=#{id}"  \
    '&action=2'  \
    "&DMSCALE=#{scale}"  \
    "&DMWIDTH=#{width}"  \
    "&DMHEIGHT=#{height}"
  end

 def local_file
    File.open(local_filepath, 'r') { |file| file.read }
  end

  def local_filepath
    File.join(cache_dir,  filename) + ".jpg"
  end

  def filename
    Digest::SHA1.hexdigest("#{collection}:#{id}")
  end

  def cache_dir
    File.join(Rails.root, 'tmp', 'cache', 'cdm_images')
  end

end