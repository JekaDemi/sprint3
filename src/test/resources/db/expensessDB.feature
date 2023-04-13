
  Feature: User Story 4

    As a user of the Duobank Mortgage Application, I want to be able to easily provide and update
    information related to my current living situation and expenses through the Expenses page of the
    mortgage application. I expect this information to be securely stored in a database schema designed
    by the database developer to ensure the safety of my personal and financial data.


    @db_only
  Scenario: The database schema should have "tbl_mortagage" table that can store user information
  related to their living situation and expenses
    Given The database contains expenses page information
    |rent_own_status|
    |monthly_rental_payment|
    |first_mortagage_total_payment|


  Scenario: The "rent_own_status" field should only allow two values, "Rent" and "Own".
    Given The user filling out form with Rent check box
    Given The user filling out form with Own check box
    Then On the database the rent_own_status should have only Rent or Own values

  Scenario: The "monthly_rental_payment" and "first_mortgage_total_payment" fields should only allow
  positive numeric values
    Given The payment fields should have only positive numeric values

  Scenario: Upon successful submission of the page information, the "Expenses" page form fields should be
  mapped to their corresponding columns in the “tbl_mortagage” table in the database
    Given The input information should be mapped in database correctly