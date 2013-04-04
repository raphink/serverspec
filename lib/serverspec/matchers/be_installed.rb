RSpec::Matchers.define :be_installed do
  match do |actual|
    do_check(commands.check_installed(actual))
  end
end
