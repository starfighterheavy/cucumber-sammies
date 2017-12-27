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

When /^I click on "([^\"]+)"$/ do |text|
  contains_text = %{contains(., \"#{text}\")}
  # find the innermost selector that matches
  element = page.find(:xpath, ".//*[#{contains_text} and not (./*[#{contains_text}])]")
  element.click
end

Then(/^I wait ([0-9]+) seconds$/) do |seconds|
  sleep seconds.to_i
end

Then /^(?:|I )should be on the (.+) page$/ do |page_name|
  fragment = URI.parse(current_url).fragment
  fragment.sub!(/[#?].*/, '') if fragment # most js frameworks will usually use ? and # for params, we dont care about those
  current_path = URI.parse(current_url).path
  current_path << "##{fragment}" if fragment.present?
  expected_path = resolve_path(page_name)

  # Consider two pages equal if they only differ by a trailing slash.
  current_path = expected_path if current_path.chomp("/") == expected_path.chomp("/")
  current_path = expected_path if current_path.gsub("/#", "#") == expected_path.gsub("/#", "#")

  current_path.should == expected_path
end
