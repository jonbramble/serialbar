module Serialbar
 module Adapter
  module InstanceMethods
  end

  	module ClassMethods

  		def foo
    	end

    	def configure_adapter(type,classname="DataFile")
    		base = const_get classname
			  load_adapter(base,type)
		end

		def load_adapter(base,type)
			# load module based on type
			case type
				when :mongoid
          require 'serialbar/adapters/mongoid'
          mod = Mongoid::Document
        when :filesystem	
          require 'serialbar/adapters/file_system'	
			end
  			base.send :include, mod	
  		end

  	end 	

  	def self.included(base)
    	base.extend(ClassMethods)
    	base.send :include, InstanceMethods   	
  	end

 end
end
