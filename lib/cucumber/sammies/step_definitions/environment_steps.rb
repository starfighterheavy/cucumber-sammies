Given /^the "(.*)" ENV is set to "(.*)"$/ do |key, value|
  ENV[key] = value
end

Given /^the "(.*)" ENV should be set to "(.*)"$/ do |key, value|
  expect(ENV[key]).to eq value
end

Then /^"(.*)" should raise a "(.*)" error$/ do |expression, error|
  expect { send(expression) }.to raise_error(/#{error}/)
end

Then /^"(.*)" should not raise a "(.*)" error$/ do |expression, error|
  expect { send(expression) }.not_to raise_error(/#{error}/)
end
