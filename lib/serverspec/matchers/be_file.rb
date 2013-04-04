RSpec::Matchers.define :be_file do
  match do |actual|
    do_check(commands.check_file(actual))
  end
end
