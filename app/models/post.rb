class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user, :foreign_key => :author_id ,:class_name =>"User"
  validates_presence_of :title, :description, :author_id

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
