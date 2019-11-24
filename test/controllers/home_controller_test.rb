test "should get contact" do
  get contact_url
  assert_response :success

  assert_template layout: 'application'

  assert_select 'title', 'Comedy Club Podcasts'
  assert_select 'h2', 'Contact Us'
  assert_select 'h3', 'Complete the following form to get in touch with us.'
end
