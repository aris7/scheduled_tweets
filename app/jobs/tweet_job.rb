class TweetJob < ApplicationJob
  queue_as :default

  def perform(tweet)
    return if tweet.published?

    # Rescheduled a tweet ot the future
    return if tweet.publish_at > Time.current

    tweet.publish_to_twitter!
  end
end
