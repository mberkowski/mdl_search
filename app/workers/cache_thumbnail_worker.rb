class CacheThumbnailWorker
  include Sidekiq::Worker
  def perform(collection, id, type)
    MDL::Thumbnail.new(collection: collection, id: id, type: type).save
  end
end