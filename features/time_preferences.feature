@javascript
Feature: add Time preferences for a given faculty member

 As a professor
 So that I can have a schedule that works for me
 I want to provide my time preferences

 Background: faculties,courses,classrooms,day-combinations and time-slots have been added to the database

   Given the following semesters exist:
   | SemesterTitle |
   | Fall 2015 |

   And the following faculties exist:
   | faculty_name |
   | faculty_1 |
   | Chen Jianer |
   | Ioerger Thomas |

   And the following courses exist:
   | course_name | CourseTitle |
   | CSCE 606 | test1 |
   | CSCE/ECEN 680 | test2 |
   | CSCE 629 | test3 |
   | CSCE 608 | test4 |
   | CSCE 625 | test5 |
   
   And the following buildings exist:
   | building_name |
   | HRBB |
   | CHEN |

   And the following rooms exist:
   | room_name | building_id |
   | 124 | 1 |
   | 126 | 2 |

   And the following day-combinations exist:
   | day_combination |
   | MW |
   | MWF |

   And the following time-slots exist:
   | time_slot |
   | 8:00 am to 8:50 am |
   | 9:35 am to 10:50 am |
   | 12:45 pm to 2:00 pm |
   | 5:30 pm to 6:45 pm |
   
   And the following faculty-course mappings exist:
   | faculty_id | course1_id | course2_id | course3_id | semester_id |
   | 2          | 3          | 4          |            | 1           |
   | 1          | 1          | 2          |            | 1           |
   
   And the following faculty-preference exist:
   | faculty_course_id | preference1_id | preference2_id | preference3_id |
   |                   | 2              | 1              | 3              |
   
   And I am on the home page
   When I choose semester "Fall 2015" and follow "Edit Faculty Preference"
   Then I am on the addpreference page


 Scenario: setting time preferences
   When I choose preference_1 "8:00 am to 8:50 am" from "time_slot"
   And I press "Submit"
   Then I should see "Please Select"
   And I should see "Please Select"
   And I should see "Please Select"
   And I should see "Please Select"