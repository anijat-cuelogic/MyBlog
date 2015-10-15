class AddCommentedByToComment < ActiveRecord::Migration
  def change
    add_column :comments, :commented_by, :integer
  end
end
