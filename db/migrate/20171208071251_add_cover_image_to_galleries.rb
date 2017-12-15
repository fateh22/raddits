class AddCoverImageToGalleries < ActiveRecord::Migration[5.1]
  def change
    add_column :galleries, :cover_image, :boolean, default: false
  end
end
