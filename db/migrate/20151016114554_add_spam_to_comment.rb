class AddSpamToComment < ActiveRecord::Migration
  def change
    add_column :comments, :spam, :boolean
  end
end
