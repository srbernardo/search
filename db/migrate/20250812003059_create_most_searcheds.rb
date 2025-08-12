class CreateMostSearcheds < ActiveRecord::Migration[7.0]
  def change
    create_table :most_searcheds do |t|
      t.string :query
      t.string :ip
      t.integer :times_searched

      t.timestamps
    end
  end
end
