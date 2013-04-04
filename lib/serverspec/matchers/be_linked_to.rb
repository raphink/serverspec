require 'puppet'
require 'puppet/type/file'

RSpec::Matchers.define :be_linked_to do |target|
  match do |link|
    f = Puppet::Type::File.new(:name => link, :ensure => 'link', :target => target)
    f.insync?(f.retrieve)
  end
end
