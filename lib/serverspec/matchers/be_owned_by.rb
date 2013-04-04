RSpec::Matchers.define :be_owned_by do |owner|
  match do |file|
    do_check(commands.check_owner(file, owner))
  end
end
