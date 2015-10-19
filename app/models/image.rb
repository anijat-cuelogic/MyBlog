class Image < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true
  has_attached_file :attachment,
    :styles => {:medium => "300x300>",
      :thumb => "60x60>"}, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :attachment, content_type: /\Aimage\/.*\Z/
end
