require 'puppet'
require 'puppet/type/file'

RSpec::Matchers.define :be_grouped_into do |group|
  match do |file|
    f = Puppet::Type::File.new(:name => file, :group => group)
    f.insync?(f.retrieve)
  end
end
