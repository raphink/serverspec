module Serverspec
  module Helper
    module MCollective
      def backend
        Serverspec::Backend::MCollective.new
      end
    end
  end
end
