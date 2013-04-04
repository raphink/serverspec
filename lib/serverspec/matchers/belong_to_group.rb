RSpec::Matchers.define :belong_to_group do |group|
  match do |user|
    do_check(commands.check_belonging_group(user, group))
  end
end
