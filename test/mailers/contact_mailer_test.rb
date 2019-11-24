require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
  # test "the truth" do
  #   assert true
  # end
  def contact_email
    ContactMailer.contact_email("vichinyan.daniel@gmail.com", "Daniel Vichinyan",
                                "1234567890", @message = "Hello")
    assert_equal ['info@comedyclubpodcasts.com'], mail.to
    assert_equal ['info@comedyclubpodcasts.com'], mail.from
  end
end
