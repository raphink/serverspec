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
      unless @aug
        @aug ||= ::Augeas.open(nil, nil, ::Augeas::NO_LOAD)
        # Remove unnecessary lenses
        # Cleanup path
        parts = @name.split('/')[2..-1].map { |e| e.gsub(/\[[^\]]*\]/, '')  }
        conds = []
        until parts.empty?
          conds << "'/#{parts.join('/')}'=~glob(.)"
          parts.pop
        end
        auto_path = "/augeas/load/*[count(incl[#{conds.join(' or ')}])=0]"
        no_auto_path = "/augeas/load/*[count(incl[#{conds.join(' or ')}])!=0]"
        @aug.rm(auto_path) unless @aug.match(no_auto_path).empty?
        @aug.load!
      end
      @aug
    end
  end
end
