class ApplicationMailer < ActionMailer::Base
  default to: 'info@comedyclubpodcasts.com',from: 'info@comedyclubpodcasts.com'
  layout 'mailer'
end
