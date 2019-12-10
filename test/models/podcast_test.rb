require 'test_helper'

class PodcastTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
  end

  test "should save valid podcast" do
    podcast = Podcast.new

    podcast.title = "MyPodcast"
    podcast.description = "This podcast is a test podcast."
    podcast.user = @user

    podcast.save
    assert podcast.valid?
  end

  test "should not save invalid podcast" do
    podcast = Podcast.new
    podcast.save
    refute podcast.valid?
  end
end
