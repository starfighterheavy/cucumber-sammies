Given 'I generate a random email' do
  @email = Faker::Internet.email
end

Then /^there should be (\d+) (.*)$/ do |count, model|
  expect(resolve_class(model).count).to eq(count.to_i)
end

Given /^the Rails cache is cleared$/ do
  Rails.cache.clear
end

When /^the ([a-z]+) (.*) should have the ([a-z_]+) "(.*)"$/ do |ordinal, model, key, value|
  expect(resolve_class(model).send(ordinal).send(key).to_s).to eq(value)
end

Then /^the ([a-z_]+) of the ([a-z]+) (.*) should be (blank|present)$/ do |key, ordinal, model, value|
  expect(resolve_class(model).send(ordinal).send(key).to_s).to send("be_#{value}")
end

Then 'the JSON response should be an array that includes:' do |json|
  expected = JSON.parse(json)
  actual = JSON.parse(last_response.body)
  expect(actual).to be_a Array
  expect((expected - actual)).to be_empty
end

Then 'the JSON response should be an object that includes:' do |json|
  expected = JSON.parse(json)
  actual = JSON.parse(last_response.body)

  expect(actual).to be_a Hash
  expect((expected.to_a - actual.to_a)).to be_empty
end
