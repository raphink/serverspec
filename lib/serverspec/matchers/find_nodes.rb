RSpec::Matchers.define :find_nodes do |number|
  match do |actual|
    backend.check_nodes(example, number, actual)
  end
end
