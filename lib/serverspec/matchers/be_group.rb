require 'puppet'
require 'puppet/type/group'

RSpec::Matchers.define :be_group do
  match do |actual|
    g = Puppet::Type::Group.new(:name => actual)
    g_real = g.retrieve
    if g.provider.exists?
      g.insync?(g_real)
    else
      false
    end
  end
end
