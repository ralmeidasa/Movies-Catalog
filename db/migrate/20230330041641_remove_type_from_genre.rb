class RemoveTypeFromGenre < ActiveRecord::Migration[7.0]
  def change
    remove_column :genres, :type, :string
  end
end
