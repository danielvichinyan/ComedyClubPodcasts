require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
    @podcast = podcasts(:one)
  end

  test "should save valid comment" do
    comment = Comment.new

    comment.user_email = "bob@example.com"
    comment.content = "This comment is a test comment."
    comment.user = @user
    comment.podcast = @podcast

    comment.save
    assert comment.valid?
  end

  test "should not save invalid comment" do
    comment = Comment.new
    comment.save
    refute comment.valid?
  end
end
