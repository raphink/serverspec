RSpec::Matchers.define :use_ami do
  match do |actual|
    backend.check_ami(actual)
  end
end
