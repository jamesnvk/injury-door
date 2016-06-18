class Post < ActiveRecord::Base
  include Slugifiable::InstanceMethods
  belongs_to :user
  has_many :comments
  has_many :users, through: :comments

  def written_by
    user = User.find(self.user_id)
    user.first_name + " " + user.last_name
  end

  def formatted_created_at
    self.created_at.strftime("%b %d, %Y")
  end

 # def to_param
    #self.slug
 # end

end
