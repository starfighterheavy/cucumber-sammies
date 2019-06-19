Dir[File.join(File.dirname(__FILE__), '/step_definitions/*_steps.rb')].each do |f|
  name = File.basename(f, '.rb')
  require "cucumber/sammies/step_definitions/#{name}"
end
