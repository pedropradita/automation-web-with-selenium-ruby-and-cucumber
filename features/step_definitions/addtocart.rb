require 'selenium-webdriver'
require 'rubygems'
require 'rspec'

driver = Selenium::WebDriver.for:chrome

Given("open the website login cart") do
  driver.navigate.to "https://www.bukalapak.com/login?from=nav_header&direct=1&comeback=https%3A%2F%2Fwww.bukalapak.com%2F%3Ffrom%3Dhttps%3A%2F%2Fwww.bukalapak.com%2F"
end

Then("user input email login cart") do
  driver.find_element(:xpath,'//*[@id="user_session_username"]').send_keys "testqabl@gmail.com"
end

Then("user input password login cart") do
  driver.find_element(:xpath,'//*[@id="user_session_password"]').send_keys "123456abc"
end

Then("click button Login cart") do
  driver.find_element(:xpath,'//*[@id="new_user_session"]/button/i').click
end

Then("user in home page cart") do
  wait = Selenium::WebDriver::Wait.new(:timeout => 15)
  log "Test Passed: Login Validated" if wait.until {
    /test qa/.match(driver.page_source)
}
end

Then("click button add to cart") do
  driver.navigate.to "https://www.bukalapak.com/p/food/minuman/11kh6yu-jual-pocari-sweat-botol-350ml?from=bukamart-homepage-1"
  driver.find_element(:xpath,'//*[@id="section-main-product"]/div[2]/div[5]/div/button[2]').click
end

Then("user find product in cart") do
  driver.navigate.to "https://www.bukalapak.com/cart/carts?from=nav_header"
  wait = Selenium::WebDriver::Wait.new(:timeout => 15)
  log "Test Passed: Add to Cart Validated" if wait.until {
    /Pocari Sweat Botol 350ml./.match(driver.page_source)
}
end

Then("user delete product in cart") do
driver.find_element(:xpath,'//*[@id="js-cart-wrapper"]/section[2]/div/div/div[1]/div[2]/div/div[2]/div/div/div[3]/div[2]/div/div/div/span[2]/span/span').click
end

Then("user closing the browser cart") do
  driver.quit
end
