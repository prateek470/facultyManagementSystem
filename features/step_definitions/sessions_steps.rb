

# For Admin Session
# Comment out last step of the preferences.rb
# In sessions.new view name the Login button "login_btn"
# In home view (admin) name logout button "logout_link"

# TODO: Refactor the first two steps into one; Test works successfully

# Cesar's 2nd Attempt Begin

Given /^the faculty listed below exist:$/ do |faculty_table|
  faculty_table.hashes.each do |faculty_args|
    Faculty.create!(faculty_args)
  end
end

Given /^the users listed below exist:$/ do |users_table|
  users_table.hashes.each do |users_args|
    User.create!(users_args)
  end
end

Given /^the sessions listed below exist:$/ do |session_table|
  session_table.hashes.each do |session_args|
    Session.create!(seesion_args)
  end
end

Given (/^I am logged in with credentials "(.*?)" and "(.*?)"$/) do |email, password|
  visit login_path
  fill_in("Email", :with => email)
  fill_in("Password", :with => password)
  click_button("login_btn")
end

# Cesar's 2nd Attempt End

Given(/^the following faculty is signed up$/) do |faculty_table|
  faculty_table.hashes.each do |faculty_args|
    #click_link("Signup")
    User.create!(faculty_args)
  end
end

Given(/^(".*") is not an admin$/) do |user| 
  faculty = Faculty.find_by_faculty_name(user)
  faculty.permission = 'User'
end
  

# step that seeds faculty needed for test for Administrators
Given(/^the following faculty is signed up as an administrator$/) do |faculty_table|
  #Faculty.create!({:faculty_name => 'Keyser John', :permission => 'Admin'}) # Make sure faculty exists
  faculty_table.hashes.each do |faculty_args|
      Faculty.create!({:faculty_name => 'Tyler Windham',:id=>1, :permission => 'Admin'}) # Make sure faculty exists
      User.create!(:faculty_name=>'Tyler Windham', :faculty_id=>1, :email=>'tyler@tamu.edu',:password=>'BBB')
  end
end

Given(/^the following faculty is signed up as a professor$/) do |faculty_table|
  #Faculty.create!({:faculty_name => 'Keyser John', :permission => 'Admin'}) # Make sure faculty exists
  faculty_table.hashes.each do |faculty_args|
      Faculty.create!({:faculty_name => 'Nick Mankus',:id=>2, :permission => 'User'}) # Make sure faculty exists
      User.create!(:faculty_name=>'Nick Mankus', :faculty_id=>2, :email=>'nick@tamu.edu',:password=>'AAA')
  end
end

=begin

# step that seeds faculty needed for test for Administrators
Given(/^the following faculty is signed up as an administrator$/) do |faculty_table|
  #Faculty.create!({:faculty_name => 'Keyser John', :permission => 'Admin'}) # Make sure faculty exists
  faculty_table.hashes.each do |faculty_args|
      Faculty.create!({:faculty_name => 'Tyler Windham',:id=>1, :permission => 'Admin'}) # Make sure faculty exists
      User.create!(:faculty_name=>'Tyler Windham', :faculty_id=>1, :email=>'tyler@tamu.edu',:password=>'BBB')
  end
end

Given(/^the following faculty is signed up as a professor$/) do |faculty_table|
  #Faculty.create!({:faculty_name => 'Keyser John', :permission => 'Admin'}) # Make sure faculty exists
  faculty_table.hashes.each do |faculty_args|
      Faculty.create!({:faculty_name => 'Nick Mankus',:id=>1, :permission => 'User'}) # Make sure faculty exists
      User.create!(:faculty_name=>'Nick Mankus', :faculty_id=>1, :email=>'nick@tamu.edu',:password=>'AAA')
  end
end

=end

# step when being logged in is required
Given(/^I am logged in with creds "(.*?)" and "(.*?)"$/) do |email, password|
  visit login_path
  fill_in("Email", :with => email)
  fill_in("Password", :with => password)
  %{I press (button)}
end

When (/^I click "(.*?)"$/) do |button|
  %{I press (button)}
end
