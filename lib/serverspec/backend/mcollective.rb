require 'mcollective'

include ::MCollective::RPC

module Serverspec
  module Backend
    class MCollective
      def method_missing(meth, *args, &block)
        if meth.to_s.match('check_(.*)')
          action = $1
          values = *args
          mc = rpcclient('spec')
          mc.progress = false
          # TODO: Get host
          host  = 'foo.example.com'
          mc.fact_filter 'fqdn', host
          status = true
          mc.check(:action => $1, :values => values).each do |resp|
            # Could be useful if testing classes/groups of machines
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
