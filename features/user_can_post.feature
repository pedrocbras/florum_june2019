Feature: Create posts
  "As a visitor
  In order to discuss plants with others
  I would like to be able to post to the forum"

  Background:
    Given the following user exists
      | email            | password     | name    |
      | fatbob@gmail.com | ilovecatfood | Fat Bob |
    And I am logged in as 'fatbob@gmail.com'
    And I visit the site
    And I click "FLORUM"
    And I click "New Post"

  Scenario: Visitor successfully creates a post
    When I fill the "Title" with "Flower Power"
    And I fill the "Text" with "Flower Power to the people!!"
    And I click "Post"
    Then I should be on Posts index page
    And I should see "Your post was successfully created"
    And I should see "Flower Power"
    And I should see "Flower Power to the people!!"
    And I should see "Writen By"
    And I should see "Fat Bob"

  Scenario: Visitor doesn't enter a title or text for the post [Sad Path]
    When I fill the "Title" with ""
    And I fill the "Text" with ""
    And I click "Post"
    Then I should see 'Invalid Title or Text.'