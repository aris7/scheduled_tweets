require 'tweetkit'

class TwitterAccount < ApplicationRecord
  belongs_to :user
  has_many :tweets

  validates :username, uniqueness: true

  def client
    client = Tweetkit::Client.new do |config|
      config.bearer_token = Rails.application.credentials.dig(:twitter, :bearer_token)
      config.consumer_key = Rails.application.credentials.dig(:twitter, :api_key)
      config.consumer_secret = Rails.application.credentials.dig(:twitter, :api_secret)
    end
  end
end
