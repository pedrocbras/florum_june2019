Feature: Open up posts
  "As a user,
  In order to interact with a post
  I would like to be able to open it."

  Background:
    Given the following user exists
    | name    |
    | Fat Bob |
    | Slim Jim|
    And the following post exists
    | title        | text          | user     |
    | Codeacademy  | Smooth-ride   | Fat Bob  |
    | Hacklife     | smaaaahht     | Slim Jim |
    And I am logged in as "Fat Bob"  
   
  Scenario: Reader can open up posts
    When I visit the site
    And I click "FLORUM"
    And I click on "Open" 
    Then I should see "Title: Codeacademy"
    And I should see "Text: Smooth-ride"
    And I should see "Author: Fat Bob"
    And I should not see "Title: Hacklife"
    And I should not see "Text: smaaaahht"
    And I should not see "Author: Slim Jim"

    