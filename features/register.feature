@RegisterUser
Feature: Register User

@Register
Scenario: Register
Given open the website
Then user input name
Then user input email
Then user select gender
Then user input username
Then user input password register
Then user input confirm password register
Then user checklist regulations
Then user click button register
Then user in home page after register
Then user closing the browser
