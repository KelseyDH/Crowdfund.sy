class Profile < ActiveRecord::Base
  belongs_to :user

  def full_name
    if first_name || last_name
      "#{first_name} #{last_name}".squeeze(" ").strip
    end
  end
end
