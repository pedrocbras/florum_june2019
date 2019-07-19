Feature: User can edit post
  "As a visitor,
  In order to change my posts,
  I would like the ability to edit them"
  
  Background:
    Given the following user exists
    | name    |
    | Fat Bob |
    | Slim Jim|
    And the following post exists
    | title        | text          | user     |
    | Codeacademy  | Smooth-ride   | Fat Bob  |
    
  Scenario: Reader can edit his own posts
    Given I am logged in as "Fat Bob"  
    When I visit the site
    And I click "FLORUM"
    And I click on "Open" on post
    Then I should see "Author: Fat Bob"
    And I should see "Title: Codeacademy"
    And I should see "Text: Smooth-ride"
    Then I click on "Edit"
    And I fill the "Title" with "Pyramids"
    And I fill the "Text" with "Aliens?"
    And I click "Update Post"
    Then I should see "Author: Fat Bob"
    And I should see "Title: Pyramids"
    And I should see "Text: Aliens?"


  Scenario: User can't edit other user's post
    When I am logged in as "Slim Jim" 
    And I visit the site
    And I click "FLORUM"
    And I click on "Open" 
    Then I should not see "Edit"