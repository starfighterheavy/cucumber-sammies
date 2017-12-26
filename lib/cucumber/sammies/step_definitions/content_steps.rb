Then /^the page title should be "(.*)"$/ do |title|
  expect(page.title).to eq(title)
end

Then(/^I see the (.*) flash message$/) do |message|
 expect(page).to have_content(resolve_locale(message))
end

Then(/^I (should )?see the localized text for "(.*)"$/) do |_should, message|
 expect(page).to have_content(resolve_locale(message))
end
