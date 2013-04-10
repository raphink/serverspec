require 'mcollective'

include ::MCollective::RPC

module Serverspec
  module Backend
    class MCollective
      def check_nodes(example, number, *)
        #warn example.methods.join(',')
        #warn example.metadata.keys.join(',')
        mc = rpcclient('rpcutil')
        mc.progress = false
        classes = example.metadata[:classes] || []
        classes.each do |c|
          mc.class_filter c
        end
        facts = example.metadata[:facts] || []
        facts.each do |f, v|
          mc.fact_filter f, v
        end
        mc.discover.size == number
      end

      def method_missing(meth, *args, &block)
        if meth.to_s.match('check_(.*)')
          action = $1
          example, values = *args
          mc = rpcclient('spec')
          mc.progress = false
          classes = example.metadata[:classes] || []
          classes.each do |c|
            mc.class_filter c
          end
          facts = example.metadata[:facts] || []
          facts.each do |f, v|
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
