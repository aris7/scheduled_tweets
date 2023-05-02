class TwitterAccount < ApplicationRecord
  belongs_to :user
  has_many :tweets

  validates :username, uniqueness: true

  def client
    Twitter::REST::Client.new do |config|
      config.consumer_key = "Rails.application.credentials.dig(:twitter, :api_key)"
      config.consumer_token = "Rails.application.credentials.dig(:twitter, :api_secret) "
      config.access_token = ""
      config.access_token_secret = ""
    end
  end
end
