Feature: Visitor Can Navigate via Navbar
  "As a visitor,
  In order to navigate to different sections of the site,
  I would like to be able to use a navbar"

  Scenario: Visitor Sees Navbar Links on Main Page
    Given I visit the site
    And I should see "HOME"
    And I should see "LOGIN"
    And I should see "SIGN UP"
    And I should see "MARKETPLACE"
    And I should see "FLORUM"
