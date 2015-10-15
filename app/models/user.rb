class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :comments
  has_many :user_roles
  has_many :roles,:through => :user_roles
  validates_presence_of :name

  def role?(role)
    return !!self.roles.find_by_name(role.to_s)
  end

end
