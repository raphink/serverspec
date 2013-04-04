require 'puppet'
require 'puppet/type/file'

RSpec::Matchers.define :be_directory do
  match do |actual|
    d = Puppet::Type::File.new(:name => actual, :ensure => 'directory')
    d.insync?(d.retrieve)
  end
end
