class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user, :foreign_key => :author_id ,:class_name =>"User"
  validates_presence_of :title, :description, :author_id
end
