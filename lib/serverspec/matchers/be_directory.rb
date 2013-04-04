RSpec::Matchers.define :be_directory do
  match do |actual|
    do_check(commands.check_directory(actual))
  end
end
