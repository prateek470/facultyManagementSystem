Feature: Administrator Login
  
  As an administrator
  So that I can create a course assignment schedule
  I want to be able to login with administrator privileges
  
  Background: At least one user is already signed up
  
    Given the faculty listed below exist:
      | faculty_name    | permission | preference |
      | Keyser John     | Admin      | -1         |
      | Chavira Cesar   | Admin      | -1         |
      | Mankus Nicholas | Admin      | -1         | 
  

    And the users listed below exist:
      | faculty_id | faculty_name | email          | password |
      | 1          | Keyser John  | kj@example.com | AAA      |
      | 2          | Chavira Cesar| cc@example.com | BBB      |

    
  Scenario: successfully sign up new user

    Given I am on the login page
    When I follow "Signup"
    Then I should be on the signup page
    When I select "Mankus Nicholas" from "sessionId"
    When I fill in "user[email]" with "doom@aol.com"
    And I fill in "user[password]" with "fish"
    And I press "singup_button"
    Then I am on the login page
    
  Scenario: The administrator logs in
 
    Given I am on the login page 
    When I fill in "Email" with "kj@example.com"
    And I fill in "Password" with "AAA"
    And I press "login_btn"
    Then I am on the home page
    And I should see "Edit Faculty"


  Scenario: The administrator logs out
  
    Given I am logged in with credentials "kj@example.com" and "AAA"
    And I am on the home page 
    And I should see "Edit Faculty"
    When I follow "logout_link"
    Then I should be on the login page
    But I should not see "Edit Faculty"


