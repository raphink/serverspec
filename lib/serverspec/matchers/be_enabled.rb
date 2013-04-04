require 'puppet'
require 'puppet/type/service'

RSpec::Matchers.define :be_enabled do
  match do |actual|
    s = Puppet::Type::Service.new(:name => actual, :enable => 'true')
    s.insync?(s.retrieve)
  end
end
