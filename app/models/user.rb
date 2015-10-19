class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts, :foreign_key => :author_id ,:class_name =>"Post", dependent: :destroy
  has_many :comments, :foreign_key => :commented_by ,:class_name =>"Comment", dependent: :destroy
  has_and_belongs_to_many :roles
  validates_presence_of :name

  has_attached_file :image, styles: { medium: "300x300>", thumb: "60x60>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def role?(role)
    return !!self.roles.find_by_name(role.to_s)
  end

end
