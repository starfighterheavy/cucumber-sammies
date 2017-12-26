Given /^the cookie "(.*)" is set to "(.*)"$/ do |cookie, value|
  page.driver.browser.set_cookie("#{cookie}=#{value}")
end
