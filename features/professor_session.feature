Feature: Professor Log In

    As a professor
    So that I can insert my preferences
    I want to be able to login to the application
    
  Background: At least one user is already signed up
  
    Given the faculty listed below exist:
      | faculty_name | permission | preference |
      | Leyk Teresa  | User       | -1         |
      | Huang Jeff   | User       | -1         |
      | Fake User    | None       | -1         |
  
    And the users listed below exist:
      | faculty_id | faculty_name | email          | password |
      | 1          | Leyk Teresa  | lt@example.com | AAA      |
      | 2          | Huang Jeff   | hj@example.com | BBB      |
      | 3          | Fake User    | fu@example.com | CCC      |        

# Scenario for creating a user is on the admin session feature
    
  Scenario: The professor logs in
 
    Given I am on the login page 
    When I fill in "Email" with "lt@example.com"
    And I fill in "Password" with "AAA"
    And I press "login_btn"
    Then I am on the home page
    And I should see "Edit Preferences"


  Scenario: The professor logs out
    Given I am logged in with credentials "lt@example.com" and "AAA"
    And I am on the home page 
    And I should see "Edit Preferences"
    When I follow "logout_link"
    Then I should be on the login page
    But I should not see "Edit Preferences"
    
  Scenario: The professor does not give correct credentials
    
    Given I am on the login page
    When I fill in "Email" with "lt@example.com"
    And I fill in "Password" with "aaa"
    And I press "login_btn"
    Then I am on the login page
    And I should see "Log In"
    
# Test strictly for coverage

  Scenario: The professor does not have any permission
    
    Given I am on the login page
    When I fill in "Email" with "fu@example.com"
    And I fill in "Password" with "CCC"
    And I press "login_btn"
    Then I am on the login page
    And I should see "Log In"

  

