class Post < ActiveRecord::Base
  include Slugifiable::InstanceMethods
  include Formatify

  belongs_to :user
  has_many :comments
  has_many :users, through: :comments
  #adds methods #post_categories, post_categories<<, post_category_ids=
  has_many :post_categories
  #adds methods category_ids
  has_many :categories, through: :post_categories

  def to_param
    "#{id}-#{title.parameterize}"
  end

  def categories_attributes=(categories_hash)
    categories_hash.each do |i, category_attributes|
      if category_attributes != ""
        category = Category.find_or_create_by(name: category_attributes[:name])
        self.post_categories.build(category: category)
      end
    end
  end

end
