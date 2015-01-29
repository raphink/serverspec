module Serverspec::Type
  class Augeas < Base
    def match(count)
      require 'augeas'
      @aug ||= ::Augeas.open
      @aug.match(@name).size == count
    end

    def value
      @aug ||= ::Augeas.open
      @aug.get(@name)
    end
  end
end
