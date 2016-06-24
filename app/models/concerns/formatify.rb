module Formatify
  def written_by
    user = User.find(self.user_id)
    user.first_name + " " + user.last_name
  end

  def formatted_created_at
    self.created_at.strftime("%b %d, %Y")
  end

end