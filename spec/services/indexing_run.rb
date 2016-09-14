require 'rails_helper'

RSpec.describe IndexingRunner, type: :service do
  it "creates a new IndexingRun if none exist and returns its created date" do
     expect(IndexingRunner.last_indexing_run).to eq Time.now.strftime "%Y-%m-%d"
  end

  it "finds the most last created IndexingRun" do
     IndexingRun.create
     IndexingRun.create
     last = IndexingRun.create
     expect(IndexingRunner.last_indexing_run).to eq Time.now.strftime "%Y-%m-%d"
  end


end
