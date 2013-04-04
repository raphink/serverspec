RSpec::Matchers.define :be_enabled do
  match do |actual|
    do_check(commands.check_enabled(actual))
  end
end
