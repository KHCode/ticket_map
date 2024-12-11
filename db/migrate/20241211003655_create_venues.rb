class CreateVenues < ActiveRecord::Migration[7.0]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :tm_id
      t.string :lat
      t.string :long

      t.timestamps
    end
  end
end
