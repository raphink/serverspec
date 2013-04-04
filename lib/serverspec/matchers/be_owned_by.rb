require 'puppet'
require 'puppet/type/file'

RSpec::Matchers.define :be_owned_by do |owner|
  match do |file|
    f = Puppet::Type::File.new(:name => file, :owner => owner)
    f.insync?(f.retrieve)
  end
end
