class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts, :foreign_key => :author_id ,:class_name =>"Post"
  has_many :comments, :foreign_key => :commented_by ,:class_name =>"Comment"
  has_many :user_roles
  has_many :roles,:through => :user_roles
  validates_presence_of :name

  def role?(role)
    return !!self.roles.find_by_name(role.to_s)
  end

end
