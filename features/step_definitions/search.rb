require 'selenium-webdriver'
require 'rubygems'
require 'rspec'

driver = Selenium::WebDriver.for:chrome

Given("open the website search") do
  driver.navigate.to "https://www.bukalapak.com"
end

Then("user input name product") do
  driver.find_element(:xpath,'//*[@id="v-omnisearch__input"]').send_keys "iphone"
end

Then("user click button search") do
  driver.find_element(:xpath,'//*[@id="v-omnisearch"]/button').click
end

Then("user find the result") do
  wait = Selenium::WebDriver::Wait.new(:timeout => 15)
  log "Test Passed: Result Validated" if wait.until {
    /Hasil pencarian iphone/.match(driver.page_source)
    /iphone/.match(driver.page_source)
}
end

Then("user closing the browser search") do
  driver.quit
end
