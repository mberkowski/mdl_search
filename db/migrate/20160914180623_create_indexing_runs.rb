class CreateIndexingRuns < ActiveRecord::Migration
  def change
    create_table :indexing_runs do |t|

      t.timestamps null: false
    end
  end
end
