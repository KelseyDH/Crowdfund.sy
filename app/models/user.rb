class User < ActiveRecord::Base

  #rails method for adding encryption/decryption
  has_secure_password
  has_one :profile
  has_many :campaigns

  accepts_nested_attributes_for :profile


  validates :email, presence: true, uniqueness: true, email_format: true


  delegate :full_name, :address, to: :profile
end
