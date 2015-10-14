class Comment < ActiveRecord::Base
  belongs_to :post
  validates_presence_of :description, :commented_by
end
