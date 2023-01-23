class CreateArtworks < ActiveRecord::Migration[7.0]
  def change
    create_table :artworks do |t|
      t.belongs_to :person
      t.string :title
      t.text :descripton
      t.string :type

      t.timestamps
    end
  end
end
