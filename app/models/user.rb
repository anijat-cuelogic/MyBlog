class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts, :foreign_key => :author_id ,:class_name =>"Post", dependent: :destroy
  has_many :comments, :foreign_key => :commented_by ,:class_name =>"Comment", dependent: :destroy
  has_and_belongs_to_many :roles

  has_many :images, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :images
  has_many :votes

  validates_presence_of :name

  def role?(role)
    return !!self.roles.find_by_name(role.to_s)
  end

  def vote?(comment,flag)
    self.votes.where("comment_id =? AND value =?",comment.id,flag)
  end

end
