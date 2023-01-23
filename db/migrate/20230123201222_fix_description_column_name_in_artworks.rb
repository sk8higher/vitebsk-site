class FixDescriptionColumnNameInArtworks < ActiveRecord::Migration[7.0]
  def change
    rename_column :artworks, :descripton, :description
  end
end
