require 'puppet'
require 'puppet/type/file'

RSpec::Matchers.define :be_file do
  match do |actual|
    f = Puppet::Type::File.new(:name => actual, :ensure => 'file')
    f.insync?(f.retrieve)
  end
end
