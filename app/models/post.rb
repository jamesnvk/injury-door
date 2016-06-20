class Post < ActiveRecord::Base
  include Slugifiable::InstanceMethods
  belongs_to :user
  has_many :comments
  has_many :users, through: :comments
  #adds methods #post_categories, post_categories<<, post_category_ids=
  has_many :post_categories
  #adds methods category_ids
  has_many :categories, through: :post_categories 

  def written_by
    user = User.find(self.user_id)
    user.first_name + " " + user.last_name
  end

  def formatted_created_at
    self.created_at.strftime("%b %d, %Y")
  end

  def to_param
    "#{id}-#{title.parameterize}"
  end

end
