require 'test_helper'

class PodcastTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
  end

  test "should save valid podcast" do
    podcast = Podcast.new

    podcast.title = "MyPodcast"
    podcast.description = "This podcast is a test podcast."
    podcast.banner_file_name = "testBanner"
    podcast.audio_file_name = "testAudio"
    podcast.video_file_name = "testVideo"
    podcast.user_id = @user.id
    podcast.save
    assert podcast.valid?
  end

  test "should not save invalid podcast" do
    podcast = Podcast.new
    podcast.save
    refute podcast.valid?
  end

  test "should not save podcast with empty title" do
    podcast = Podcast.new

    podcast.title = ""
    podcast.description = "This podcast is a test podcast."
    podcast.banner_file_name = "testBanner"
    podcast.audio_file_name = "testAudio"
    podcast.video_file_name = "testVideo"
    podcast.user_id = @user.id
    podcast.save
    refute podcast.valid?
  end

  test "should not save podcast with a small title" do
    podcast = Podcast.new

    podcast.title = "Ye"
    podcast.description = "This podcast is a test podcast."
    podcast.banner_file_name = "testBanner"
    podcast.audio_file_name = "testAudio"
    podcast.video_file_name = "testVideo"
    podcast.user_id = @user.id
    podcast.save
    refute podcast.valid?
  end

  test "should not save podcast with a small description" do
    podcast = Podcast.new

    podcast.title = "MyPodcast"
    podcast.description = "Ya"
    podcast.banner_file_name = "testBanner"
    podcast.audio_file_name = "testAudio"
    podcast.video_file_name = "testVideo"
    podcast.user_id = @user.id
    podcast.save
    refute podcast.valid?
  end

  test "should not save podcast with an empty description" do
    podcast = Podcast.new

    podcast.title = "MyPodcast"
    podcast.description = ""
    podcast.banner_file_name = "testBanner"
    podcast.audio_file_name = "testAudio"
    podcast.video_file_name = "testVideo"
    podcast.user_id = @user.id
    podcast.save
    refute podcast.valid?
  end
end
