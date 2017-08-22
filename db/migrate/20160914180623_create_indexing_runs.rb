class CreateIndexingRuns < ActiveRecord::Migration[4.2]
  def change
    create_table :indexing_runs do |t|

      t.timestamps null: false
    end
  end
end
