Given /the following faculty-preference exist:/ do |faculty_preferences|
  faculty_preferences.hashes.each do |fac_pref|
  # each returned element will be a hash whose keys will be the table header
  # arrange to add the faculty preference to the databse here
  FacultyPreference.create!(fac_pref)
  end
end

When /^I choose preference_(\d+) "(.*?)" from "(.*?)"$/ do |name,field|
  step "I select \"#{name}\" from \"semester_id\""
end

#When(/^I select "(.*?)" from "(.*?)"$/) do |arg1, arg2|
#  visit "/addpreference"
#end

#Given /^I am on the home page$/ do
#  visit "home"
#end

#Then /^I am on the addpreference page$/ do
#  visit "/addpreference"
#end

#When /^I press "(.*?)"$/ do
#  visit "/addpreference"
#end

#Then /^I should see "(.*?)"$/ do |text|
 # page.should have_content text
#end
