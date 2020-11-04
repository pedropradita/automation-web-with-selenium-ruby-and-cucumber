require 'selenium-webdriver'
require 'rubygems'
require 'rspec'

driver = Selenium::WebDriver.for:chrome

Given("open the website login") do
  driver.navigate.to "https://www.bukalapak.com/login?from=nav_header&direct=1&comeback=https%3A%2F%2Fwww.bukalapak.com%2F%3Ffrom%3Dhttps%3A%2F%2Fwww.bukalapak.com%2F"
end

Then("user input email login") do
  driver.find_element(:xpath,'//*[@id="user_session_username"]').send_keys "testqabl@gmail.com"
end

Then("user input password login") do
  driver.find_element(:xpath,'//*[@id="user_session_password"]').send_keys "123456abc"
end

Then("click button Login") do
  driver.find_element(:xpath,'//*[@id="new_user_session"]/button/i').click
end

Then("user in home page") do
  wait = Selenium::WebDriver::Wait.new(:timeout => 15)
  log "Test Passed: Login Validated" if wait.until {
    /test qa/.match(driver.page_source)
}
end

Then("user closing the browser login") do
  driver.quit
end
