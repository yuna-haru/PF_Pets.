class AddHashbodyToPostImage < ActiveRecord::Migration[6.1]
  def change
    add_column :post_images, :hashbody, :text
  end
end
