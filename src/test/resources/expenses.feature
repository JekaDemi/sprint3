@a
Feature:Expenses feature

  As a potential homebuyer, I want to use the Preapproval Details
  page of my bank's mortgage application to provide the necessary
  information to get pre-approved for a mortgage loan

  Background: Common steps for all scenarios
    Given The user is on the logging page
    When User entering email and password
    Then User is locating expenses page


  Scenario: User can select only one check box
    Given The user is on Expenses page
    When User selects Rent
    Then Own should not be selected
    When User selects Own
    Then Rent should not be selected

  Scenario: User successfully filling out Expenses form with Rent check box selected
    Given The user is on Expenses page
    When User selecting Rent check box
    Then User entering numeric Monthly Rental Payment
    And Clicks on Save button

  Scenario: User successfully filling out Expenses form with Own check box selected
    Given The user is on Expenses page
    When User selecting Own check box
    Then User entering numeric Monthly Mortgage Payment
    And Clicks on Save button

  Scenario: User should write only positive number is field Monthly Rental Payment or get an error message
    Given The user is on Expenses page
    When User selecting Rent check box
    And User is entering numeric value less than one in Rent
    Then User should get error message Please enter a value greater than or equal to zero in Rent
    When User is entering non numeric value in Rent
    Then User should get error message Please enter a valid number in Rent

  Scenario: User should write only positive number is field Monthly Mortgage Payment or get an error message
    Given The user is on Expenses page
    When User selecting Own check box
    And User is entering numeric value less than one in Own
    Then User should get error message Please enter a value greater than or equal to zero in Own
    When User is entering non numeric value in Own
    Then User should get error message Please enter a valid number in Own

    Scenario: User should not be able to proceed to the next page if the field for the selected option (Monthly Rental Payment or Monthly Mortgage Payment) is empty
      Given The user is on Expenses page
      When User selecting Rent check box
      And User leaves field Monthly Rental Payment empty
      Then Clicks on Save button
      And User should see THIS FIELD IS REQUIRED message displayed under the empty field in Rent.
      When User selecting Own check box
      And User leaves field Monthly Mortgage Payment empty
      Then Clicks on Save button
      And User should see THIS FIELD IS REQUIRED message displayed under the empty field in Own.

  Scenario: User should be able to return on previous page by clicking Previous button
    Given The user is on Expenses page
    When User click on Previous button
    Then User is returned to Personal Information page

