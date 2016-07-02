class Comment < ActiveRecord::Base
  include Formatify
  belongs_to :post
  belongs_to :user

  validates_presence_of :content
end
