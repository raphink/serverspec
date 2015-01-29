module Serverspec::Type
  class Augeas < Base
    def match(count)
      aug_handler.match(@name).size == count
    end

    def value
      aug_handler.get(@name)
    end

    def has_node?(path)
      aug_handler.set('/augeas/context', @name)
      aug_handler.match(path).any?
    end

    private
    def aug_handler
      require 'augeas'
      @aug ||= ::Augeas.open
    end
  end
end
