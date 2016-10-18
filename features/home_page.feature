Feature: home page to have links to navigate to various pages

As a administrator of the Course Assignment System
So that I can navigate to different feature pages
I want to see a administrator home page with links to other pages

#Background: the user is on the home page
 #  Given I am on the home page

# 1. Scenario for the 'Add Courses and Faculty' link
Scenario: User clicks on the 'Add Courses and Faculty' button
  Given: the element "add_courses_and_faculty" should exist
  When: I press "add_courses_and_faculty" 
  Then: I should be on the 'Add Courses and Faculty' page

# 2. Scenario for the 'Add Classrooms and Timings' link
Scenario: User clicks on the 'Add Classrooms and Timings' button
  Given: the element "add_classroom_and_timings" should exist
  When: I press "add_classroom_and_timings"
  Then: I should be on the 'Add Classrooms and Timings' page

# 3. Scenario for the 'Show Courses assigned' link
Scenario: User clicks on the 'Show Courses assigned' button
  Given: the element "show_courses_assigned" should exist
  When: I press "show_courses_assigned"
  Then: I should be on the 'Show Courses assigned' page

# 4. Scenario for the 'Show Faculty Preferences' link
Scenario: User clicks on the 'Show Faculty Preferences' button
  Given: the element "show_faculty_preferences" should exist
  When: I press "show_faculty_preferences"
  Then: I should be on the 'Show Faculty Preferences' page

# 5. Scenario for the 'Show Conflict Resolution' link
Scenario: User clicks on the 'Show Conflict Resolution' button
  Given: the element "show_conflict_resolution" should exist
  When: I press "show_conflict_resolution"
  Then: I should be on the 'Show Conflict Resolution' page

# 6. Scenario for the 'Add New Faculty' link
Scenario: User clicks on the 'Add New Faculty' button
  Given: the element "add_new_faculty" should exist
  When: I press "add_new_faculty"
  Then: I should be on the 'Add New Faculty' page

# 7. Scenario for the 'Add New Course' link
Scenario: User clicks on the 'Add New Course' button
  Given: the element "add_new_course" should exist
  When: I press "add_new_course"
  Then: I should be on the 'Add New Course' page
  
# 8. Scenario for the 'Calendar' link
Scenario: View Calendar
  Given the element "calendar" should exist
  When I press "calendar" 
  Then I should be on the "Calendar" page
  
# 9. Scenario for the 'Reset User Account' link
Scenario: User clicks on the 'Reset User Account' button
  Given: the element "resetuser" should exist
  When: I press "resetuser" 
  Then: I should be on the 'Reset User Account' page
  
# 10. Scenario for the 'Edit Faculty Preferences' link
Scenario: User clicks on the 'Edit Faculty Preferences' button
  Given: the element "addpreference" should exist
  When: I press "addpreference"
  Then: I should be on the 'Edit Faculty Preferences' page
  
