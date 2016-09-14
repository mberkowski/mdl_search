class IndexingRunner

  def self.last_indexing_run
    get_date(last_or_first)
  end

  private

  def self.last_or_first
    IndexingRun.create if IndexingRun.all.empty?
    IndexingRun.order("created_at").last
  end

  def self.get_date(run)
    run.created_at.strftime "%Y-%m-%d"
  end
end