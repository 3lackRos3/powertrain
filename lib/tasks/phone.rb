require 'mechanize'



a = Mechanize.new

a.get('http://www.ebay-kleinanzeigen.de/') do |page|

	signin = a.click(home_page.link_with(:text => /Einloggen/))

	my_page = signin.form_with(:id => 'login-form') do |form|
		email_field = form.field_with(name: "loginMail") 
		password_field = form.field_with(name: "password") 
		email_field.value = "beharsllamniku@hotmail.de"
		password_field.value = "beharr"
  end.submit
end