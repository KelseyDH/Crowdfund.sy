class ApiKey < ActiveRecord::Base
  belongs_to :user

  before_create :generate_unique_access_token

  private

  def generate_unique_access_token
    #begin will execute code at least once
    begin
      self.access_token = SecureRandom.hex
    end while self.class.exists?(access_token: access_token)
    #could also write ApiKey.exists?(access_token: access_token)
  end
end
