class RemoveTypeColumnFromArtworks < ActiveRecord::Migration[7.0]
  def change
    remove_column :artworks, :type
  end
end
