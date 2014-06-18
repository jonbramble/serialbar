module Serialbox
  module DataPoint

   module ClassMethods

    def adapter
      return @adapter if @adapter  
        self.adapter = :mongoid   # this is default but also appears not be be editable
     	@adapter  
    end

    def adapter=(adapter_name)
    	case adapter_name
    	when Symbol, String
      	require "serialbox/adapters/#{adapter_name}"	
        load_adapter(Serialbox::Adapters)   
    	else
      	raise "Missing adapter #{adapter_name}"
      end
    end

    def initialize_adapter
     puts "init adapter"
     adapter
    end

    # capture the missing methods from the adapter and load the adapter from the module
    def method_missing(m, *args, &block)
     #adapter # must call this to get the require file
    end

    def load_adapter(modules)
     self.send :include, modules    
    end

  end

  def self.included(receiver)
   receiver.extend ClassMethods
  end

  end

end
