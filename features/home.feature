Feature: Show Home Page
  So I can check Crowd's news
  As a user
  I open the Crowd Culture Site

  Scenario: Visualize the Home Page
    When I go to the home page
    Then show me the page
    Then I should see "WE ENJOY OUR CULTURE"
    And I should see a feed selector