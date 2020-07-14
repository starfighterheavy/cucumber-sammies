Given /^the "(.*)" ENV is set to "(.*)"$/ do |key, value|
  ENV[key] = value
end

Given /^the "(.*)" ENV should be set to "(.*)"$/ do |key, value|
  expect(ENV[key]).to eq value
end
