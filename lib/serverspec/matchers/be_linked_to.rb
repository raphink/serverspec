RSpec::Matchers.define :be_linked_to do |target|
  match do |link|
    do_check(commands.check_link(link, target))
  end
end
