require 'puppet'
require 'puppet/type/user'

RSpec::Matchers.define :be_user do
  match do |actual|
    u = Puppet::Type::User.new(:name => actual)
    u_real = u.retrieve
    if u.provider.exists?
      u.insync?(u.retrieve)
    else
      false
    end
  end
end
