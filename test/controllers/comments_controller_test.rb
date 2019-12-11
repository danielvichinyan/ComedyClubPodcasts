require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @podcast = podcasts(:one)
    @comment = comments(:one)
    @user = users(:one)
    @user.save
    sign_in @user
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post podcast_comments_url(@podcast), params: { comment: { content: @comment.content, user_id: @user.id, podcast_id: @podcast.id } }
    end
  end

end
