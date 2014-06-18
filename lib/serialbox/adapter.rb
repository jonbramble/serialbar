module Serialbox
 module Adapter
  module InstanceMethods

  end

  	module ClassMethods

  		def foo
      		puts 'class method'
    	end

    	def configure_adapter(type,classname="DataFile")
    		base = const_get classname
			  load_adapter(base,type)
		end

		def load_adapter(base,type)
			# load module based on type
			case type
				when :mongoid
          require 'mongoid'
          mod = Mongoid::Document
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
