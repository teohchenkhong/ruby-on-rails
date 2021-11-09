ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
	:address => 'smtp.sendgrid.net',
	:port => '587',
	:authentication => :plain,
	:user_name => 'apikey',
	:password => ENV["SENDGRID_PASSWORD"],
	:domain => 'heroku.com',
	:enable_starttls_auto => true
}