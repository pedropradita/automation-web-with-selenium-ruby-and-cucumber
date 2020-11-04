@LoginUser
Feature: Login User

@Login
Scenario: Login
Given open the website login
Then user input email login
Then user input password login
Then click button Login
Then user in home page
Then user closing the browser login
