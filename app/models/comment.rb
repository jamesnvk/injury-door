class Comment < ActiveRecord::Base
  include Formatify
  belongs_to :post
  belongs_to :user
end
