class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :name
      t.datetime :date
      t.string :url
      t.string :tm_id

      t.timestamps
    end
  end
end
