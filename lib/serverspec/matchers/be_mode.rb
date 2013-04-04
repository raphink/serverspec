require 'puppet'
require 'puppet/type/file'

RSpec::Matchers.define :be_mode do |mode|
  match do |file|
    f = Puppet::Type::File.new(:name => file, :mode => mode)
    f.insync?(f.retrieve)
  end
end
