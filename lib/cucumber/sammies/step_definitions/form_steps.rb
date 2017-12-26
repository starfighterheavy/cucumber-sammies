When(/^I click "(.*)"$/) do |link|
  click_on link
end

When(/^I click the first "(.*)"$/) do |link|
  first('a,input', text: link).click
end

When(/^I click the "(.*)" submit button$/) do |link|
  find(link).click
end

When(/^I check the ([^"]+) box$/) do |label|
  check resolve_locale(label)
end

When(/^I check the "(.*)" box$/) do |field|
  check field
end

When(/^I upload "(.*)" to "(.*)"$/) do |file_path, field|
  attach_file(field, file_path)
end

When /^I select the date "(.*)" from "(.*)"$/ do |date, field|
  date = date.split(' ')
  if date.count == 2
    month, year = date
    day = nil
  else
    month, day, year = date
  end
  select_year_month(year: year, month: month, day: day, field: field)
end

def select_year_month(year:, month:, day: nil, field:)
  unless field.include?('_')
    field = find(:xpath, ".//label[contains(.,'#{field}')]")[:for]
    field.gsub!(/_[1-3]{1}i$/, '')
  end
  select year,  :from => "#{field}_1i"
  select month, :from => "#{field}_2i"
  select day, :from => "#{field}_3i" if day
end
