Then /^I should not see the table "(.*)"$/ do |caption|
  expect(page).not_to have_css('caption', text: caption)
end

Then /^the table "(.*)" should contain:$/ do |caption, data|
  table = page.find('caption', text: caption).first(:xpath, './/..').all('tr').map do |tr|
    tr.all('th,td').map(&:text)
  end
  data.diff!(table)
end
