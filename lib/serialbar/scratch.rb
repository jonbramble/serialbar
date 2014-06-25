 # module DataPoint
    #extend Mongoid::Document

  	

  #  module ClassMethods

		
 #   end
	
 #   module InstanceMethods
      
		
 #   end

 #  def self.included(receiver)
 #    receiver.extend         ClassMethods
 #    receiver.send :include, InstanceMethods
 #  end

 # end


      	  c_name = "#{adapter_name.to_s.capitalize}"
	  doc = Serialbox::Adapters.const_get(c_name).constants 
	  adpstr = c_name+"::"+doc[0].to_s
	  @adapter = adpstr.constantize


  #module DataPoint

     #def adapter

     #end
     # include Mongoid::Document  # what if we want alternative configurable data end points

     # what other attributes might the general datapoint have
     # unique id is included with mongoid
     # field :time

  #end
