Then /^the page title should be "(.*)"$/ do |title|
  expect(page.title).to eq(title)
end

Then /^the page body should include "(.*)"$/ do |content|
  expect(page.body).to include(content)
end

Then /^I should see "(.*)"$/ do |content|
  expect(page).to have_content(content)
end

Then /^I should not see "(.*)"$/ do |content|
  expect(page).not_to have_content(content)
end

Then(/^I see the (.*) flash message$/) do |message|
 expect(page).to have_content(resolve_locale(message))
end

Then(/^I (should )?see the localized text for "(.*)"$/) do |_should, message|
 expect(page).to have_content(resolve_locale(message))
end
