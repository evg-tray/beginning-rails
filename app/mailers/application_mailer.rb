class ApplicationMailer < ActionMailer::Base
  default from: 'heroku.test@scrapmaker.ru'
  layout 'mailer'
end
