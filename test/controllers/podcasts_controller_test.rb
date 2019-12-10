require 'test_helper'

class PodcastsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @podcast = podcasts(:one)
    @user = users(:one)
    @user.save
    sign_in @user
  end

  test "should get index" do
    get podcasts_url
    assert_response :success
  end

  test "should get new" do
    get new_podcast_url
    assert_response :success
  end

  test "should create podcast" do
    assert_difference('Podcast.count') do
      post podcasts_url, params: { podcast: { description: @podcast.description, title: @podcast.title, user_id: @user.id } }
    end

    assert_redirected_to podcast_url(Podcast.last)
  end

  test "should show podcast" do
    get podcast_url(@podcast)
    assert_response :success
  end

  test "should get edit" do
    get edit_podcast_url(@podcast)
    assert_response :success
  end

  test "should update podcast" do
    patch podcast_url(@podcast), params: { podcast: { description: @podcast.description, title: @podcast.title } }
    assert_redirected_to podcast_url(@podcast)
  end

  test "should destroy podcast" do
    assert_difference('Podcast.count', -1) do
      delete podcast_url(@podcast)
    end

    assert_redirected_to podcasts_url
  end
end
