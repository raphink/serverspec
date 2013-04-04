RSpec::Matchers.define :be_grouped_into do |group|
  match do |file|
    do_check(commands.check_grouped(file,group))
  end
end
