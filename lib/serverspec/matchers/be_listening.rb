RSpec::Matchers.define :be_listening do
  match do |actual|
    port = actual.gsub(/port\s+/, '')
    do_check(commands.check_listening(port))
  end
end
