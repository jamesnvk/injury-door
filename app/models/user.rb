class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  validates_presence_of :first_name, :last_name
  has_many :posts
  has_many :comments
  # commented_posts == all the posts that a user has commented on. 
  has_many :commented_posts, through: :comments, source: :post
  

   def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.first_name = auth.info.name.split(" ")[0]  
      user.last_name = auth.info.name.split(" ")[1]  
    end
  end

end
