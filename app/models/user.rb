class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]
  validates_presence_of :first_name, :last_name
  has_many :posts
  has_many :comments
  # commented_posts == all the posts that a user has commented on. 
  has_many :commented_posts, through: :comments, source: :post
  

   def self.from_omniauth(auth)
    ##binding.pry
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.first_name = auth.info.name.split(" ")[0]  
      user.last_name = auth.info.name.split(" ")[1]
    end
  end

  #latest post for each user
  def self.latest_post
    self.all.map {|u| u.posts.last}
  end

  #user with the most posts
  def self.most_posts
    self.all.max_by {|u| u.posts.size}
  end

end
