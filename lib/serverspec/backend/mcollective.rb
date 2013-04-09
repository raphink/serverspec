require 'mcollective'

include ::MCollective::RPC

module Serverspec
  module Backend
    class MCollective
      def method_missing(meth, *args, &block)
        if meth.to_s.match('check_(.*)')
          action = $1
          example, values = *args
          mc = rpcclient('spec')
          mc.progress = false
          example.metadata[:classes].each do |c|
            mc.class_filter c
          end
          example.metadata[:facts].each do |f, v|
            mc.fact_filter f, v
          end
          status = true
          mc.check(:action => $1, :values => values).each do |resp|
            status = status && resp[:data][:passed]
          end
          status
        else
          fail "Unknown method #{meth}"
        end
      end
    end
  end
end
