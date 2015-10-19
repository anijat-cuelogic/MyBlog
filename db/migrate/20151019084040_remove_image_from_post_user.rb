class RemoveImageFromPostUser < ActiveRecord::Migration
  def change
    remove_attachment :users, :image
    remove_attachment :posts, :image
  end
end
