require 'selenium-webdriver'
require 'rubygems'
require 'rspec'

driver = Selenium::WebDriver.for:chrome

o = [('a'..'z'), ('A'..'Z'), ('1'..'10')].map(&:to_a).flatten

Given("open the website") do
  driver.navigate.to "https://www.bukalapak.com/register?from=nav_header&comeback=https://www.bukalapak.com/"
end

Then("user input name") do
    driver.find_element(:xpath,'//*[@id="user_name"]').send_keys ("a" + (10.times).map { o[rand(o.length)] }.join)
end

Then("user input email") do
    driver.find_element(:xpath,'//*[@id="email_or_phone"]').send_keys ((5.times).map { o[rand(o.length)] }.join + "@gmail.com")
end

Then("user select gender") do
    driver.find_element(:xpath,'//*[@id="new_user"]/div[3]/label[1]/span').click
end

Then("user input username") do
    driver.find_element(:xpath,'//*[@id="user_username"]').send_keys ("b" + (4.times).map{(rand(1..10))}.join)
end

Then("user input password register") do
    driver.find_element(:xpath,'//*[@id="user_password"]').send_keys "12345abc"
end

Then("user input confirm password register") do
    driver.find_element(:xpath,'//*[@id="user_password_confirmation"]').send_keys "12345abc"
end

Then("user checklist regulations") do
    driver.find_element(:xpath,'//*[@id="new_user"]/div[8]/label').click
end

Then("user click button register") do
    z = driver.find_element(:xpath,'//*[@id="new_user"]/button')
    driver.action.double_click(z).perform
end

Then("user in home page after register") do
  wait = Selenium::WebDriver::Wait.new(:timeout => 15)
  log "Test Passed: Register Validated" if wait.until {
    /Notifikasi/.match(driver.page_source)
  }
end

Then("user closing the browser") do
    driver.quit
end
