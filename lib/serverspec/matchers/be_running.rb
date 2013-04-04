require 'puppet'
require 'puppet/type/service'

RSpec::Matchers.define :be_running do
  match do |actual|
    s = Puppet::Type::Service.new(:name => actual)
    s.insync?(s.retrieve)
  end
end
