module Slugifiable
  module InstanceMethods
    def slug
      self.title.downcase.gsub(" ", "-")
    end
  end
end