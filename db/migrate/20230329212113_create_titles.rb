class CreateTitles < ActiveRecord::Migration[7.0]
  def change
    create_table :titles do |t|
      t.integer :release_year
      t.string :synopsis
      t.string :country_of_origin
      t.integer :time
      t.string :director
      t.string :genre

      t.timestamps
    end
  end
end
