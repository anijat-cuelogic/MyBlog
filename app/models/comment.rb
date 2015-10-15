class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user, :foreign_key => :commented_by ,:class_name =>"User"
  validates_presence_of :description, :commented_by
end
