require 'puppet'
require 'puppet/type/package'

RSpec::Matchers.define :be_installed do
  match do |actual|
     p = Puppet::Type::Package.new(:name => actual)
     p_real = p.retrieve
     if p.exists?
       p.insync?(p_real)
     else
       false
     end
  end
end
