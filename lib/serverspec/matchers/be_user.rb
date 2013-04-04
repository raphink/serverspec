RSpec::Matchers.define :be_user do
  match do |actual|
    do_check(commands.check_user(actual))
  end
end
