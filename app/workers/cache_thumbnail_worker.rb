class CacheThumbnailWorker
  include Sidekiq::Worker
  def perform(collection, id)
    MDL::Thumbnail.new(collection: collection, id:id).save
  end
end