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
end
