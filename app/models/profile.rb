class Profile < ActiveRecord::Base
  belongs_to :user

  geocoded_by :address
  after_validation :geocode

  def full_name
    if first_name || last_name
      "#{first_name} #{last_name}".squeeze(" ").strip
    else
      user.email
    end
  end
end
