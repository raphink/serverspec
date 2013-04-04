RSpec::Matchers.define :be_group do
  match do |actual|
    do_check(commands.check_group(actual))
  end
end
