When /^I log the page$/ do
  Cucumber.logger.info page.body
end

Then /^I pry$/ do
  binding.pry
end

Then /^I sleep (.*) seconds$/ do |seconds|
  sleep seconds.to_f
end

Then /^it should work$/ do
  pending
end
