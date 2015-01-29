module Serverspec::Type
  class Augeas < Base
    def match(count)
      require 'augeas'
      @aug ||= ::Augeas.open
      @aug.match(@name).size == count
    end
  end
end
