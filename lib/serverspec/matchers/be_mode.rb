RSpec::Matchers.define :be_mode do |mode|
  match do |file|
    do_check(commands.check_mode(file,mode))
  end
end
