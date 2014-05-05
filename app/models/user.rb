class User < ActiveRecord::Base

  #rails method for adding encryption/decryption
  has_secure_password
  has_one :profile
  has_many :campaigns

  has_one :api_key

  accepts_nested_attributes_for :profile


  validates :email, presence: true, uniqueness: true, email_format: true


  delegate :full_name, :address, to: :profile

  before_create :generate_api_key

  private

  def generate_api_key
    self.api_key = ApiKey.new

  end

end
