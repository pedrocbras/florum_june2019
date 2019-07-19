Feature:
"As a user,
In order to get rid of a wrong post,
I would like to able to delete it."

  Background:
    Given the following user exists
    | name     |
    | Fat Bob  |
    | Slim Jim |
    And the following post exists
    | title        | text          | user    |
    | Codeacademy  | Smooth-ride   | Fat Bob |

  Scenario: User can delete his post
    When I am logged in as "Fat Bob"  
    And I visit the site
    And I click "FLORUM"
    And I click "Delete"
    Then I should not see "Title: Codeacademy"
    And I should not see "Text: Smooth-ride" 

  Scenario: User can't delete other user's post
    When I am logged in as "Slim Jim" 
    And I visit the site
    And I click "FLORUM"
    Then I should not see "Delete"