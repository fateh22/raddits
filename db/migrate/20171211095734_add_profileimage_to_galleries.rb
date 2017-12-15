class AddProfileimageToGalleries < ActiveRecord::Migration[5.1]
  def change
    add_column :galleries, :profileimage, :boolean, default: false
  end
end
