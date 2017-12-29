When(/^I click "(.*)"$/) do |link|
  click_on link
end

When(/^I click the first "(.*)"$/) do |link|
  first('a,input', text: link).click
end

When(/^I click the "(.*)" submit button$/) do |link|
  find(link).click
end

When /^(?:|I )select "([^"]*)" from "([^"]*)"$/ do |value, field|
  select(value, :from => field)
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

When /^(?:|I )fill in "([^"]*)" (?:with|for) "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

Then /^nothing should be selected for "([^"]*)"$/ do |field|
  select = find_field(field)
  begin
    selected_option = select.find(:xpath, ".//option[@selected = 'selected']") || select.all(:css, 'option').first
    value = selected_option ? selected_option.value : nil
    value.should be_blank
  rescue Capybara::ElementNotFound
  end
end

# Checks for the presence of an option in a select
Then /^"([^"]*)" should( not)? be an option for "([^"]*)"$/ do |value, negate, field|
  xpath = ".//option[text() = '#{value}']"
  if negate
    begin
      field_labeled(field).find(:xpath, xpath).should_not be_present
    rescue Capybara::ElementNotFound
    end
  else
    field_labeled(field).find(:xpath, xpath).should be_present
  end
end
