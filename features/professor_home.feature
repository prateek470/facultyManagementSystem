Feature: Professor home page to have links to navigate to various pages

As a professor of the Course Assignment System
So that I can navigate to different feature pages
I want to see a professor home page with links to other pages

Background: the user is on the professor home page
   Given I am on the professor home page

# 1. Scenario for the 'View Preferences' link
Scenario: User clicks on the 'View Preferences' button
  Given: the element "viewpreferences" should exist
  When: I press "viewpreferences"
  Then: I should be on the 'View Preferences' page

# 2. Scenario for the 'Edit Preferences' link
Scenario: User clicks on the 'Edit Preferences' button
  Given: the element "professoraddpreference" should exist
  When: I press "professoraddpreference"
  Then: I should be on the 'Edit Preferences' page
