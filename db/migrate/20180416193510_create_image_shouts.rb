class CreateImageShouts < ActiveRecord::Migration[5.1]
  def change
    create_table :image_shouts do |t|
      t.attachment :image, null: false

      t.timestamps
    end
  end
end
