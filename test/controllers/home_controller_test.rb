require 'test_helper'
class HomeControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    get root_url
    assert_response :success
  end

  test "should get contact" do
    get home_contact_url
    assert_response :success

    assert_template layout: 'application'

    assert_select 'title', 'Comedy Club Podcasts'
    assert_select 'h2', 'Contact Us.'
    assert_select 'h3', 'Complete the following form to get in touch with us.'
  end

  test "should get about" do
    get home_about_url
    assert_response :success

    assert_template layout: 'application'

    assert_select 'title', 'Comedy Club Podcasts'
    assert_select 'h2', 'Who are we?'
  end

  test "should get comedians" do
    get home_comedians_url
    assert_response :success

    assert_template layout: 'application'

    assert_select 'title', 'Comedy Club Podcasts'
    assert_select 'h2', 'Our Comedians.'
  end
end
