class AddAttachmentToImage < ActiveRecord::Migration
  def change
    add_attachment :images, :attachment
  end
end
