class CreatePostBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :post_books do |t|

      t.timestamps
    end
  end
end
