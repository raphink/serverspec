module Serverspec::Type
  class Augeas < Base
    def initialize
      @aug = ::Augeas.open
      super
    end
    
    def match(count)
      require 'augeas'
      @aug.match(@name).size == count
    end

    def value
      @aug.get(@name)
    end

    def has_node?(path)
      @aug.set('/augeas/context', @name)
      @aug.match(path).any?
    end
  end
end
