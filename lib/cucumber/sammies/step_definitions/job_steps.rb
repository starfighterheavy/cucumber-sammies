When("the {string} is performed with arg {string}") do |job, arg|
  job.constantize.send("perform_now", arg)
end

When("the {string} is performed with the following:") do |job, args|
  job.constantize.send("perform_now", *args.rows_hash.values)
end

When("the {string} is performed") do |job|
  job.constantize.send("perform_now")
end
