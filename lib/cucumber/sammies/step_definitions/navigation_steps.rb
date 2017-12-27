require_relative '../support/resolvers'

Then(/^I am taken to (a|an|the) (.*) page$/) do |inclusive, path|
  path.split(' ').each do |part|
    expect(current_path.split('/')).to include(part)
  end
  unless inclusive == 'the'
    expect(current_path.split('/').last.to_i).to be > 0
  end
end

When(/^I set the subdomain to "(.*)"$/) do |subdomain|
  Capybara.app_host = "http://#{subdomain}.example.com"
end

When /^I visit "(.*)"$/ do |path|
  visit path
end

When /^(?:|I )go to the (.+) page$/ do |page_name|
  visit resolve_path(page_name)
end

When /^(?:|I )press "([^"]*)"$/ do |button|
  click_button(button)
end

When /^(?:|I )follow "([^"]*)"$/ do |link|
  click_link(link)
end

Then(/^I wait ([0-9]+) seconds$/) do |seconds|
  sleep seconds.to_i
end
